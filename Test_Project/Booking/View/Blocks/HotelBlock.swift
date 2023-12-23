//
//  HotelBlock.swift
//  Test_Project
//
//  Created by Abdulloh on 18/12/23.
//

import SwiftUI

struct HotelBlock: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @State var size: CGSize = .zero
    
    var body: some View {
        VStack(alignment: .leading) {
            if let safeDetails = viewModel.bookingDetails {
                RatingView(
                    rating: safeDetails.horating,
                    ratingName: safeDetails.rating_name
                )
                
                Text(safeDetails.hotel_name)
                    .title()
                    .padding(.bottom, 1)
                
                Text(safeDetails.hotel_adress)
                    .foregroundColor(.blue)
                    .font(.system(size: 13, weight: .medium))
            } else {
                ProgressView()
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .blockBackground(alignment: .leading)
        .padding(.top)
    }
}

#Preview {
    HotelBlock()
        .environmentObject(ViewModel())
}
