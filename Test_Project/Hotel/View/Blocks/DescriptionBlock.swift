//
//  DescriptionView.swift
//  Test_Project
//
//  Created by Abdulloh on 16/12/23.
//

import SwiftUI

struct DescriptionBlock: View {
    @EnvironmentObject var viewModel: ViewModel
    @Binding var info: HotelInfo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Об отеле")
                .title()
            
            FlexibleView(
                data: info.peculiarities,
                spacing: 5,
                alignment: .leading
            ) { item in
                Text(item)
                    .foregroundColor(Color.textSecondary)
                    .font(.system(size: 16))
                    .padding(5)
                    .background(Color.peculiarities)
                    .cornerRadius(5)
            }
            
            Text(info.description)
                .font(.system(size: 16, weight: .regular))
            
            CustomList()
        }
        .blockBackground(alignment: .center)
    }
}

#Preview {
    DescriptionBlock(
        info: .constant(
            HotelInfo(description: "Hello", peculiarities: [])
        )
    )
    .environmentObject(ViewModel())
}
