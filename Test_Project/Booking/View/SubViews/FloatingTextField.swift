//
//  FloatingTextField.swift
//  Test_Project
//
//  Created by Abdulloh on 20/12/23.
//

import SwiftUI

struct FloatingTextField: View {
    @Binding var text: String
    let placeholder: String
    var keyboard: UIKeyboardType = .default
    var phoneNumber = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(placeholder)
                .foregroundColor(.gray)
                .font(.system(size: !text.isEmpty ? 12 : 16))
                .offset(y: !text.isEmpty ? 0 : 11)
            
            TextField(
                "",
                text: $text
            )
            .keyboardType(keyboard)
            .offset(y: !text.isEmpty ? 0 : -10)
            .font(.system(size: 16))
            .onChange(of: text) { oldValue in
                if phoneNumber {
                    text = format(with: "+X (XXX) XXX-XX-XX", phone: oldValue)
                }
            }
        }
        .animation(.easeIn, value: text.isEmpty)
        .frame(height: 52)
        .padding(.horizontal, 15)
        .background(Color("Background"))
        .cornerRadius(10)
    }
}

#Preview {
    FloatingTextField(
        text: .constant(""),
        placeholder: "Hello, world"
    )
    .padding()
}