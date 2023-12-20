//
//  DescriptionView.swift
//  Test_Project
//
//  Created by Abdulloh on 16/12/23.
//

import SwiftUI

struct DescriptionBlock: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let info = viewModel.hotel?.about_the_hotel {
                Text("Об отеле")
                    .font(.system(size: 22, weight: .medium))
                
                FlexibleView(
                    data: info.peculiarities,
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
                
                Text(info.description)
                    .font(.system(size: 16, weight: .regular))
                
                CustomList()
            } else {
                ProgressView()
            }
        }
        .blockBackground(alignment: .center)
        .onAppear {
            viewModel.getHotels()
        }
    }
}

#Preview {
    DescriptionBlock()
        .environmentObject(ViewModel())
}
