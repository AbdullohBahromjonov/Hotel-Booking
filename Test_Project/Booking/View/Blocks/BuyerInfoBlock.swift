//
//  BuyerInfoBlock.swift
//  Test_Project
//
//  Created by Abdulloh on 19/12/23.
//

import SwiftUI

struct BuyerInfoBlock: View {
    @State var phoneNumber = ""
    @State var email = ""
    
    @Binding var filled: Bool
    
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
            .onChange(of: phoneNumber) {
                if !phoneNumber.isEmpty && phoneNumber.count == 11 && !email.isEmpty && email.contains("@") && email.contains("mail") && email.contains(".com") {
                    filled = true
                } else {
                    filled = false
                }
            }
            
            FloatingTextField(
                text: $email,
                placeholder: "Почта",
                keyboard: .emailAddress
            )
            .onChange(of: email) {
                if !phoneNumber.isEmpty && !email.isEmpty {
                    filled = true
                } else {
                    filled = false
                }
            }
            
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
        filled: .constant(false)
    )
}
