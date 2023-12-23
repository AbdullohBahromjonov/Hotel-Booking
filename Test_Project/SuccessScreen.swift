//
//  SuccessScreen.swift
//  Test_Project
//
//  Created by Abdulloh on 21/12/23.
//

import SwiftUI

struct SuccessScreen: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var isActive: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("🎉")
                .font(.system(size: 44))
                .padding(25)
                .background(
                    Circle()
                        .foregroundColor(Color("Background"))
                )
            
            Text("Ваш заказ принят в работу")
                .font(.system(size: 22, weight: .medium))
            
            Text("Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                .multilineTextAlignment(.center)
                .font(.system(size: 16))
                .foregroundColor(.gray)
                .padding(.horizontal)
            
            Spacer()
            
            BlueButton(
                title: "Супер!",
                action: {
                    isActive = false
                }
            )
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationTitle("Заказ оплачен")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(
                action: {
                    dismiss()
                },
                label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
            )
        )
    }
}

#Preview {
    NavigationView {
        SuccessScreen(isActive: .constant(true))
    }
}
