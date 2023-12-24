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
    
    @State var buyerFilled = false
    @State var touristFilled = false
    
    @Binding var isActive: Bool
    
    var body: some View {
        ScreenBackground(title: "Бронирование") {
            if let bookingDetails = viewModel.bookingDetails {
                ScrollView(showsIndicators: false) {
                    HotelBlock()
                    
                    BookingInfoBlock()
                    
                    BuyerInfoBlock(filled: $buyerFilled)
                        .focused($isFocused)
                    
                    ForEach(1...touristsNumber, id: \.self) { i in
                        TouristBlock(
                            title: "\(i) турист",
                            fold: i == 1 ? false : true,
                            filled: $touristFilled,
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
                                    if touristFilled == true && buyerFilled == true {
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
                .onTapGesture {
                    isFocused = false
                }
            } else {
                ProgressView()
            }
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
