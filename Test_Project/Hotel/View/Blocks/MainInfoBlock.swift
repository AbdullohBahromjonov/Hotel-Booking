//
//  MainInfoView.swift
//  Test_Project
//
//  Created by Abdulloh on 16/12/23.
//

import SwiftUI

struct MainInfoBlock: View {
    @EnvironmentObject var viewModel: ViewModel
    @Binding var hotel: Hotel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ImageCarouselView(urls: hotel.image_urls)
            
            RatingView(
                rating: hotel.rating,
                ratingName: hotel.rating_name
            )
            
            Text(hotel.name)
                .title()
            
            Text(hotel.adress)
                .foregroundColor(.blue)
                .font(.system(size: 13, weight: .medium))
            
            HStack(alignment: .bottom) {
                Text("от \(hotel.minimal_price) ₽")
                    .font(.system(size: 30, weight: .semibold))
                
                Text(hotel.price_for_it)
                    .foregroundColor(Color.textSecondary)
                    .font(.system(size: 16, weight: .regular))
                    .offset(y: -3)
            }
            .padding(.top, 10)
        }
        .blockBackground(alignment: .center)
    }
}

#Preview {
    MainInfoBlock(
        hotel:
            .constant(
                Hotel(
                    id: 1,
                    name: "",
                    adress: "",
                    minimal_price: 1,
                    price_for_it: "",
                    rating: 5,
                    rating_name: "",
                    image_urls: [],
                    about_the_hotel:
                        HotelInfo(
                            description: "",
                            peculiarities: []
                        )
                )
            )
    )
    .environmentObject(ViewModel())
}
