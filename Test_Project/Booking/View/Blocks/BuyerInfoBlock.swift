//
//  BuyerInfoBlock.swift
//  Test_Project
//
//  Created by Abdulloh on 19/12/23.
//

import SwiftUI

struct BuyerInfoBlock: View {
    @Binding var phoneNumber: String
    @Binding var email: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Информация о покупателе")
                .title()
                .padding(.bottom, 5)
            
            FloatingTextField(
                text: $phoneNumber,
                placeholder: "Номер телефона",
                keyboard: .numberPad,
                isFormated: true,
                textFormat: "+X (XXX) XXX-XX-XX"
            )
            
            FloatingTextField(
                text: $email,
                placeholder: "Почта",
                keyboard: .emailAddress
            )
            
            Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                .foregroundColor(.gray)
                .font(.system(size: 14))
                .padding(.horizontal, 5)
        }
        .blockBackground(alignment: .center)
    }
}

#Preview {
    BuyerInfoBlock(
        phoneNumber: .constant(""),
        email: .constant("")
    )
}
