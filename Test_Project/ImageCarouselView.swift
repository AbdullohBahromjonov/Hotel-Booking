//
//  ImageCarouselView.swift
//  Test_Project
//
//  Created by Abdulloh on 17/12/23.
//

import SwiftUI

struct ImageCarouselView: View {
    let urls: [String]
    
    var body: some View {
        TabView {
            ForEach(urls, id: \.self) { url in
                AsyncImage(
                    url: URL(string: url),
                    content: { image in
                        image
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(.horizontal)
                    },
                    placeholder: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.gray.opacity(0.5))
                                .padding(.horizontal)
                            
                            ProgressView()
                        }
                    }
                )
            }
        }
        .padding(.horizontal, -15)
        .frame(height: 270)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    ImageCarouselView(
        urls: [
            "https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg",
            "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg",
            "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg"
        ]
    )
    .padding()
}
