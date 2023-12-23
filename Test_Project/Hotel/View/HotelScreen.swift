//
//  HotelPreivewScreen.swift
//  Test_Project
//
//  Created by Abdulloh on 16/12/23.
//

import SwiftUI

struct HotelScreen: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @State var goToRoomsView = false
    
    var body: some View {
        ScreenBackground(title: "Отель") {
            if let hotel = viewModel.hotel {
                ScrollView(showsIndicators: false) {
                    MainInfoBlock(hotel: .constant(hotel))
                    
                    DescriptionBlock(info: .constant(hotel.about_the_hotel))
                    
                    NavigationLink(
                        destination: RoomScreen(hotelName: .constant(viewModel.hotel?.name ?? ""), isActive: $goToRoomsView),
                        isActive: $goToRoomsView,
                        label: {
                            BlueButton(
                                title: "К выбору номера",
                                action: {
                                    goToRoomsView = true
                                    viewModel.getRooms()
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
            } else {
                ProgressView()
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
            viewModel.getHotels()
        }
    }
}

#Preview {
    NavigationView {
        HotelScreen()
            .environmentObject(ViewModel())
    }
}
