//
//  BookingInfoBlock.swift
//  Test_Project
//
//  Created by Abdulloh on 20/12/23.
//

import SwiftUI

struct BookingInfoBlock: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 19) {
            if let safeDetails = viewModel.bookingDetails {
                BookingDetailItem(
                    placeholder: "Вылет из",
                    text: safeDetails.departure
                )
                
                BookingDetailItem(
                    placeholder: "Страна, город",
                    text: safeDetails.arrival_country
                )
                
                BookingDetailItem(
                    placeholder: "Даты",
                    text: "\(safeDetails.tour_date_start) – \(safeDetails.tour_date_stop)"
                )
                
                BookingDetailItem(
                    placeholder: "Кол-во ночей",
                    text: "\(safeDetails.number_of_nights) ночей"
                )
                
                BookingDetailItem(
                    placeholder: "Отель",
                    text: safeDetails.hotel_name
                )
                
                BookingDetailItem(
                    placeholder: "Номер",
                    text: safeDetails.room
                )
                
                BookingDetailItem(
                    placeholder: "Питание",
                    text: safeDetails.nutrition
                )
            } else {
                ProgressView()
            }
        }
        .blockBackground(alignment: .center)
    }
}


#Preview {
    BookingInfoBlock()
        .environmentObject(ViewModel())
}
