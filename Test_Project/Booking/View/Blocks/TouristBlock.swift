//
//  TouristBlock.swift
//  Test_Project
//
//  Created by Abdulloh on 19/12/23.
//

import SwiftUI

struct TouristBlock: View {
    let title: String
    
    @State var fold = false
    
    @Binding var name: String
    @Binding var surname: String
    @Binding var birthDate: String
    @Binding var citizenship: String
    @Binding var internationalPassportNumber: String
    @Binding var internationalPassportExpiration: String
    
    var action: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(title)
                    .title()
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
                    text: $surname,
                    placeholder: "Фамилия",
                    keyboard: .emailAddress
                )
                
                FloatingTextField(
                    text: $birthDate,
                    placeholder: "Дата рождения",
                    keyboard: .emailAddress,
                    isFormated: true,
                    textFormat: "XX.XX.XXXX"
                )
                
                FloatingTextField(
                    text: $citizenship,
                    placeholder: "Гражданство",
                    keyboard: .emailAddress
                )
                
                FloatingTextField(
                    text: $internationalPassportNumber,
                    placeholder: "Номер загранпаспорта",
                    keyboard: .emailAddress
                )
                
                FloatingTextField(
                    text: $internationalPassportExpiration,
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
        title: "Пер вый турист",
        name: .constant(""),
        surname: .constant(""),
        birthDate: .constant(""),
        citizenship: .constant(""),
        internationalPassportNumber: .constant(""),
        internationalPassportExpiration: .constant("")
    )
}
