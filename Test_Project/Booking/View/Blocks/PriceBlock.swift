//
//  PriceBlock.swift
//  Test_Project
//
//  Created by Abdulloh on 20/12/23.
//

import SwiftUI

struct PriceBlock: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            if let safeDetails = viewModel.bookingDetails {
                BookingDetailItem(
                    placeholder: "Тур",
                    text: "\(safeDetails.tour_price) ₽",
                    textAlignment: .trailing
                )
                BookingDetailItem(
                    placeholder: "Топливный сбор",
                    text: "\(safeDetails.fuel_charge) ₽",
                    textAlignment: .trailing
                )
                BookingDetailItem(
                    placeholder: "Сервисный сбор",
                    text: "\(safeDetails.service_charge) ₽",
                    textAlignment: .trailing
                )
                BookingDetailItem(
                    placeholder: "К оплате",
                    text: "\(safeDetails.tour_price + safeDetails.fuel_charge + safeDetails.service_charge) ₽",
                    textAlignment: .trailing,
                    textColor: .blue
                )
                .fontWeight(.medium)
            } else {
                ProgressView()
            }
        }
        .blockBackground(alignment: .center)
    }
}

#Preview {
    PriceBlock()
        .environmentObject(ViewModel())
}
