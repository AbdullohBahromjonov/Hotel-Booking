//
//  BlueButton.swift
//  Test_Project
//
//  Created by Abdulloh on 17/12/23.
//

import SwiftUI

struct BlueButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(
            action: action,
            label: {
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .medium))
            }
        )
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue)
        .cornerRadius(15)
        .padding()
    }
}

#Preview {
    BlueButton(
        title: "К выбору номера",
        action: {}
    )
}
