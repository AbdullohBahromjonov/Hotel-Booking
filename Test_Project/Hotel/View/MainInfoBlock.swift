//
//  MainInfoView.swift
//  Test_Project
//
//  Created by Abdulloh on 16/12/23.
//

import SwiftUI

struct MainInfoBlock: View {
    @Binding var hotel: Hotel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
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
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
}

#Preview {
    MainInfoBlock(
        hotel: .constant(
            Hotel(
                id: 1,
                name: "Лучший пятизвездочный отель в Хургаде, Египет",
                adress: "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
                minimal_price: 134268,
                price_for_it: "За тур с перелётом",
                rating: 5,
                rating_name: "Превосходно",
                image_urls: [
                    "https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg",
                    "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg",
                    "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg"
                ],
                about_the_hotel:
                    HotelInfo(
                        description: "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!",
                        peculiarities: [
                            "Бесплатный Wifi на всей территории отеля",
                            "1 км до пляжа",
                            "Бесплатный фитнес-клуб",
                            "20 км до аэропорта"
                        ]
                    )
            )
        )
    )
}

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
