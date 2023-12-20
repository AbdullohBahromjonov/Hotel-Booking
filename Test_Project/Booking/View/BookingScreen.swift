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
    
    @State var congretulation = false
    @State var touristsNumber = 1
    
    var body: some View {
        ZStack {
            Color("Background")
                .edgesIgnoringSafeArea(.bottom)
            
            ScrollView(showsIndicators: false) {
                HotelBlock()
                
                BookingInfoBlock()
                
                BuyerInfoBlock()
                    .focused($isFocused)
                
                ForEach(1...touristsNumber, id: \.self) { i in
                    TouristBlock(
                        title: "\(i) турист",
                        fold: i == 1 ? false : true,
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
                    destination: Text("Congrets"),
                    isActive: $congretulation,
                    label: {
                        BlueButton(
                            title: "Оплатить 198 036 ₽",
                            action: {
                                congretulation.toggle()
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
        .navigationTitle("Бронирование")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
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

func format(with mask: String, phone: String) -> String {
    let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
    var result = ""
    var index = numbers.startIndex

    for ch in mask where index < numbers.endIndex {
        if ch == "X" {
            result.append(numbers[index])

            index = numbers.index(after: index)

        } else {
            result.append(ch)
        }
    }
    
    return result
}
