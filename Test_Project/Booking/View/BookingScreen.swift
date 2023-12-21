//
//  BookingScreen.swift
//  Test_Project
//
//  Created by Abdulloh on 17/12/23.
//

import SwiftUI

struct BookingScreen: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: ViewModel
    
    @FocusState var isFocused: Bool
    
    @State var success = false
    @State var touristsNumber = 1
    
    @State var phoneNumber = ""
    @State var email = ""
    @State var name = ""
    @State var surname = ""
    @State var birthDate = ""
    @State var citizenship = ""
    @State var internationalPassportNumber = ""
    @State var internationalPassportExpiration = ""
    
    var body: some View {
        ScreenBackground(title: "Бронирование") {
            ScrollView(showsIndicators: false) {
                HotelBlock()
                
                BookingInfoBlock()
                
                BuyerInfoBlock(
                    phoneNumber: $phoneNumber,
                    email: $email
                )
                .focused($isFocused)
                
                ForEach(1...touristsNumber, id: \.self) { i in
                    TouristBlock(
                        title: "\(i) турист",
                        fold: i == 1 ? false : true,
                        name: $name,
                        surname: $surname,
                        birthDate: $birthDate,
                        citizenship: $citizenship,
                        internationalPassportNumber: $internationalPassportNumber,
                        internationalPassportExpiration: $internationalPassportExpiration,
                        action: i > 1 ? {
                            withAnimation {
                                touristsNumber -= 1
                            }
                        } : nil
                    )
                }
                
                HStack {
                    Text("Добавить туриста")
                        .font(.system(size: 22, weight: .medium))
                    
                    Spacer()
                    
                    Button(
                        action: {
                            withAnimation {
                                touristsNumber += 1
                            }
                        },
                        label: {
                            Image(systemName: "plus")
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .frame(width: 32, height: 32)
                                .foregroundColor(.black)
                                .background(
                                    Color.blue
                                )
                                .cornerRadius(6)
                        }
                    )
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                
                PriceBlock()
                
                NavigationLink(
                    destination: SuccessScreen(),
                    isActive: $success,
                    label: {
                        BlueButton(
                            title: "Оплатить 198 036 ₽",
                            action: {
                                if !phoneNumber.isEmpty && !email.isEmpty && !name.isEmpty && !surname.isEmpty && !birthDate.isEmpty && !citizenship.isEmpty && !internationalPassportNumber.isEmpty && !internationalPassportExpiration.isEmpty {
                                    success.toggle()
                                }
                            }
                        )
                        .padding(.bottom)
                        .padding()
                        .background(
                            Color.white
                                .ignoresSafeArea()
                        )
                    }
                )
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .onTapGesture {
            isFocused = false
        }
        .navigationBarItems(
            leading: Button(
                action: {
                    dismiss()
                },
                label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
            )
        )
    }
}

#Preview {
    NavigationView {
        BookingScreen()
    }
    .environmentObject(ViewModel())
}
