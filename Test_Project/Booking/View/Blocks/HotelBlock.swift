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
                    .font(.system(size: 22, weight: .medium))
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
        .onAppear {
            viewModel.getBookingDetails()
        }
    }
}

#Preview {
    HotelBlock()
        .environmentObject(ViewModel())
}

extension View {
    func blockBackground(alignment: Alignment) -> some View {
        modifier(BlockBackground(alignment: alignment))
    }
}

struct BlockBackground: ViewModifier {
    let alignment: Alignment
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: alignment)
            .padding()
            .background(Color.white)
            .cornerRadius(12)
    }
}
