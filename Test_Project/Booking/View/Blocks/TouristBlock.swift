//
//  TouristBlock.swift
//  Test_Project
//
//  Created by Abdulloh on 19/12/23.
//

import SwiftUI

struct TouristBlock: View {
    let title: String
    
    @State var name = ""
    @State var surname = ""
    @State var birthDate = ""
    @State var fold = false
    
    var action: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(title)
                    .font(.system(size: 22, weight: .medium))
                    .padding(.bottom, fold ? 0 : 5)
                
                Spacer()
                
                if let safeAction = action {
                    Button(
                        action: safeAction,
                        label: {
                            Image(systemName: "minus")
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .frame(width: 32, height: 32)
                                .foregroundColor(.black)
                                .background(
                                    Color.blue
                                )
                                .cornerRadius(6)
                        }
                    )
                }
                
                Button(
                    action: {
                        withAnimation {
                            fold.toggle()
                        }
                    },
                    label: {
                        Image(systemName: "chevron.down")
                            .rotationEffect(Angle(degrees: fold ? 180 : 0))
                            .foregroundColor(.blue)
                            .frame(width: 32, height: 32)
                            .foregroundColor(.black)
                            .background(
                                Color.blue.opacity(0.1)
                            )
                            .cornerRadius(6)
                    }
                )
            }
            
            if !fold {
                FloatingTextField(
                    text: $name,
                    placeholder: "Имя",
                    keyboard: .emailAddress
                )
                
                FloatingTextField(
                    text: $name,
                    placeholder: "Фамилия",
                    keyboard: .emailAddress
                )
                
                FloatingTextField(
                    text: $name,
                    placeholder: "Дата рождения",
                    keyboard: .emailAddress
                )
                
                FloatingTextField(
                    text: $name,
                    placeholder: "Гражданство",
                    keyboard: .emailAddress
                )
                
                FloatingTextField(
                    text: $name,
                    placeholder: "Номер загранпаспорта",
                    keyboard: .emailAddress
                )
                
                FloatingTextField(
                    text: $name,
                    placeholder: "Срок действия загранпаспорта",
                    keyboard: .emailAddress
                )
            }
        }
        .blockBackground(alignment: .center)
    }
}

#Preview {
    TouristBlock(
        title: "Первый турист",
        action: nil
    )
}
