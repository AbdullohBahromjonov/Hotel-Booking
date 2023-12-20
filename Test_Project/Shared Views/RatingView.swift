//
//  RatingView.swift
//  Test_Project
//
//  Created by Abdulloh on 21/12/23.
//

import SwiftUI

struct RatingView: View {
    let rating: Int
    let ratingName: String
    
    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
                .font(.system(size: 15))
            Text("\(rating) \(ratingName)")
        }
        .padding(7)
        .foregroundColor(.orange)
        .background(Color.orange.opacity(0.2))
        .cornerRadius(5)
    }
}

#Preview {
    RatingView(rating: 5, ratingName: "Amazing")
}
