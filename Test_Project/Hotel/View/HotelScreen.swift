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
            ScrollView(showsIndicators: false) {
                MainInfoBlock()
                
                DescriptionBlock()
                
                NavigationLink(
                    destination: RoomScreen(hotelName: .constant(viewModel.hotel?.name ?? "")),
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
                        .padding()
                        .background(
                            Color.white
                                .ignoresSafeArea()
                        )
                    }
                )
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    NavigationView {
        HotelScreen()
            .environmentObject(ViewModel())
    }
}
