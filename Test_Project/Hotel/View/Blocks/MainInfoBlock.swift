//
//  MainInfoView.swift
//  Test_Project
//
//  Created by Abdulloh on 16/12/23.
//

import SwiftUI

struct MainInfoBlock: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let hotel = viewModel.hotel {
                ImageCarouselView(urls: hotel.image_urls)
                
                RatingView(
                    rating: hotel.rating,
                    ratingName: hotel.rating_name
                )
                
                Text(hotel.name)
                    .font(.system(size: 22, weight: .medium))
                
                Text(hotel.adress)
                    .foregroundColor(.blue)
                    .font(.system(size: 13, weight: .medium))
                
                HStack(alignment: .bottom) {
                    Text("от \(hotel.minimal_price) ₽")
                        .font(.system(size: 30, weight: .semibold))
                    
                    Text(hotel.price_for_it)
                        .foregroundColor(Color("Text secondary"))
                        .font(.system(size: 16, weight: .regular))
                        .offset(y: -3)
                }
                .padding(.top, 10)
            } else {
                ProgressView()
            }
        }
        .blockBackground(alignment: .center)
        .onAppear {
            viewModel.getHotels()
        }
    }
}

#Preview {
    MainInfoBlock()
        .environmentObject(ViewModel())
}
