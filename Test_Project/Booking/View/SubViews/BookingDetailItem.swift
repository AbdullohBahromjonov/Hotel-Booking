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
    var placeholderAlignment: Alignment = .leading
    var textAlignment: Alignment = .leading
    var textColor: Color = .black
    
    var body: some View {
        HStack(alignment: .top) {
            Text(placeholder)
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .frame(width: UIScreen.main.bounds.size.width/2.5, alignment: .leading)
            
            if textAlignment == .trailing {
                Spacer()
            }
            
            Text(text)
                .font(.system(size: 16))
                .frame(width: UIScreen.main.bounds.size.width/2, alignment: textAlignment)
                .foregroundColor(textColor)
        }
    }
}

#Preview {
    BookingDetailItem(
        placeholder: "Email",
        text: "emailexample@mail.com"
    )
}
