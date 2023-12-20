//
//  RoomItem.swift
//  Test_Project
//
//  Created by Abdulloh on 17/12/23.
//

import SwiftUI

struct RoomBlock: View {
    @State var goToBooking = false
    
    @Binding var room: Room
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ImageCarouselView(urls: room.image_urls)
            
            Text(room.name)
                .font(.system(size: 22, weight: .medium))
            
            FlexibleView(
                data: room.peculiarities,
                spacing: 5,
                alignment: .leading
            ) { item in
                Text(item)
                    .foregroundColor(Color("Text secondary"))
                    .font(.system(size: 16))
                    .padding(5)
                    .background(Color("Features color"))
                    .cornerRadius(5)
            }
            
            HStack(spacing: 5) {
                Text("Подробнее о номере")
                
                Image(systemName: "chevron.right")
            }
            .foregroundColor(Color.blue)
            .font(.system(size: 16))
            .padding(5)
            .background(Color.blue.opacity(0.15))
            .cornerRadius(5)
            
            HStack(alignment: .bottom) {
                Text("\(room.price) ₽")
                    .font(.system(size: 30, weight: .semibold))
                
                Text(room.price_per)
                    .foregroundColor(Color("Text secondary"))
                    .font(.system(size: 16, weight: .regular))
                    .offset(y: -3)
            }
            .padding(.top, 10)
            
            NavigationLink(
                destination: BookingScreen(),
                isActive: $goToBooking,
                label: {
                    BlueButton(
                        title: "Выбрать номер",
                        action: {
                            goToBooking = true
                        }
                    )
                    .padding()
                    .background(
                        Color.white
                            .ignoresSafeArea()
                    )
                    .padding(-15)
                }
            )
        }
        .blockBackground(alignment: .center)
    }
}


#Preview {
    ZStack {
        Color("Background")
            .ignoresSafeArea()
        
        RoomBlock(room:
            .constant(
                Room(
                    id: 1,
                    name: "Hotel",
                    price: 130500,
                    price_per: "Everything",
                    peculiarities: [
                        "Бесплатный Wifi на всей территории отеля",
                        "1 км до пляжа"
                    ],
                    image_urls: [
                        "https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg",
                        "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg",
                        "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg"
                    ]
                )
            )
        )
    }
}
