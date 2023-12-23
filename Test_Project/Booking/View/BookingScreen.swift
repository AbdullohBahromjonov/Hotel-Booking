//
//  BookingScreen.swift
//  Test_Project
//
//  Created by Abdulloh on 17/12/23.
//

import SwiftUI

struct BookingScreen: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    
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
    
    @Binding var isActive: Bool
    
    var body: some View {
        ScreenBackground(title: "Бронирование") {
            if let bookingDetails = viewModel.bookingDetails {
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
                    .focused($isFocused)
                    
                    AddTouristBlock(touristsNumber: $touristsNumber)
                    
                    PriceBlock()
                    
                    NavigationLink(
                        destination: SuccessScreen(isActive: $isActive),
                        isActive: $success,
                        label: {
                            BlueButton(
                                title: "Оплатить \(bookingDetails.tour_price + bookingDetails.fuel_charge + bookingDetails.service_charge) ₽",
                                action: {
                                    if !phoneNumber.isEmpty && !email.isEmpty && !name.isEmpty && !surname.isEmpty && !birthDate.isEmpty && !citizenship.isEmpty && !internationalPassportNumber.isEmpty && !internationalPassportExpiration.isEmpty {
                                        success = true
                                    }
                                }
                            )
                            .padding(.bottom)
                            .background(
                                Color.white
                                    .ignoresSafeArea()
                            )
                        }
                    )
                }
                .edgesIgnoringSafeArea(.bottom)
            } else {
                ProgressView()
            }
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
        .onAppear {
            viewModel.getBookingDetails()
        }
    }
}

#Preview {
    NavigationView {
        BookingScreen(isActive: .constant(true))
    }
    .environmentObject(ViewModel())
}
