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
    var isFormated = false
    var textFormat = ""
    
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
                if isFormated {
                    text = Test_Project.format(with: textFormat, phone: oldValue)
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

func format(with mask: String, phone: String) -> String {
    let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
    var result = ""
    var index = numbers.startIndex

    for ch in mask where index < numbers.endIndex {
        if ch == "X" {
            result.append(numbers[index])

            index = numbers.index(after: index)

        } else {
            result.append(ch)
        }
    }
    
    return result
}
