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
    
    let rows = [
        GridItem(.flexible(minimum: 0, maximum: 100)),
        GridItem(.flexible(minimum: 0, maximum: 500))
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background")
                
                if let safeHotel = viewModel.hotel {
                    ScrollView(showsIndicators: false) {
                        MainInfoBlock(
                            hotel: .constant(safeHotel)
                        )
                        
                        DescriptionBlock(hotelInfo: .constant(safeHotel.about_the_hotel))
                        
                        NavigationLink(
                            destination: RoomScreen(hotelName: .constant(safeHotel.name)),
                            isActive: $goToRoomsView,
                            label: {
                                BlueButton(
                                    title: "К выбору номера",
                                    action: {
                                        goToRoomsView = true
                                        viewModel.getRooms()
                                    }
                                )
                            }
                        )
                        
                    }
                } else {
                    ProgressView()
                }
            }
            .onAppear {
                viewModel.getHotels()
            }
            .navigationTitle("Отель")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    HotelScreen()
        .environmentObject(ViewModel())
}
