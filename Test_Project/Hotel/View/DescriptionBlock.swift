//
//  DescriptionView.swift
//  Test_Project
//
//  Created by Abdulloh on 16/12/23.
//

import SwiftUI

struct DescriptionBlock: View {
    @Binding var hotelInfo: HotelInfo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Об отеле")
                .font(.system(size: 22, weight: .medium))
            
            FlexibleView(
                data: hotelInfo.peculiarities,
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
            
            Text(hotelInfo.description)
                .font(.system(size: 16, weight: .regular))
            
            CustomList()
            
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
}

#Preview {
    DescriptionBlock(
        hotelInfo: .constant(
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
}
