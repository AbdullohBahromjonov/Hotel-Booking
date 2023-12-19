//
//  BookingDetailItem.swift
//  Test_Project
//
//  Created by Abdulloh on 18/12/23.
//

import SwiftUI

struct BookingDetailItem: View {
    let placeholder: String
    let text: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text(placeholder)
                .padding(.horizontal)
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .frame(width: UIScreen.main.bounds.size.width/2.5, alignment: .leading)
            Text(text)
                .font(.system(size: 16))
                .frame(width: UIScreen.main.bounds.size.width/2, alignment: .leading)
        }
    }
}

#Preview {
    BookingDetailItem(
        placeholder: "Email",
        text: "emailexample@mail.com"
    )
}
