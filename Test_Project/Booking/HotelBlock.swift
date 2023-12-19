//
//  HotelBlock.swift
//  Test_Project
//
//  Created by Abdulloh on 18/12/23.
//

import SwiftUI

struct HotelBlock: View {
    var body: some View {
        VStack(alignment: .leading) {
            RatingView(
                rating: 5,
                ratingName: "Amazing"
            )
            
            Text("Steigenberger Makadi")
                .font(.system(size: 22, weight: .medium))
            
            Text("Madinat Makadi, Safaga Road, Makadi Bay, Египет")
                .foregroundColor(.blue)
                .font(.system(size: 13, weight: .medium))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .padding(.top)
    }
}

#Preview {
    HotelBlock()
}
