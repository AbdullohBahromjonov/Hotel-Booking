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
    
    @State var name = ""
    @State var surname = ""
    @State var birthDate = ""
    @State var citizenship = ""
    @State var internationalPassportNumber = ""
    @State var internationalPassportExpiration = ""
    
    @Binding var filled: Bool
    
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
                    )                }
                
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
                .onChange(of: name) {
                    if !name.isEmpty && !surname.isEmpty && !birthDate.isEmpty && !citizenship.isEmpty && !internationalPassportNumber.isEmpty && !internationalPassportExpiration.isEmpty {
                        filled = true
                    } else {
                        filled = false
                    }
                }
                
                FloatingTextField(
                    text: $surname,
                    placeholder: "Фамилия",
                    keyboard: .emailAddress
                )
                .onChange(of: surname) {
                    if !name.isEmpty && !surname.isEmpty && !birthDate.isEmpty && !citizenship.isEmpty && !internationalPassportNumber.isEmpty && !internationalPassportExpiration.isEmpty {
                        filled = true
                    } else {
                        filled = false
                    }
                }
                
                FloatingTextField(
                    text: $birthDate,
                    placeholder: "Дата рождения",
                    keyboard: .numberPad,
                    isFormated: true,
                    textFormat: "XX.XX.XXXX"
                )
                .onChange(of: birthDate) {
                    if !name.isEmpty && !surname.isEmpty && !birthDate.isEmpty && !citizenship.isEmpty && !internationalPassportNumber.isEmpty && !internationalPassportExpiration.isEmpty {
                        filled = true
                    } else {
                        filled = false
                    }
                }
                
                FloatingTextField(
                    text: $citizenship,
                    placeholder: "Гражданство",
                    keyboard: .emailAddress
                )
                .onChange(of: citizenship) {
                    if !name.isEmpty && !surname.isEmpty && !birthDate.isEmpty && !citizenship.isEmpty && !internationalPassportNumber.isEmpty && !internationalPassportExpiration.isEmpty {
                        filled = true
                    } else {
                        filled = false
                    }
                }
                
                FloatingTextField(
                    text: $internationalPassportNumber,
                    placeholder: "Номер загранпаспорта",
                    keyboard: .emailAddress
                )
                .onChange(of: internationalPassportNumber) {
                    if !name.isEmpty && !surname.isEmpty && !birthDate.isEmpty && !citizenship.isEmpty && !internationalPassportNumber.isEmpty && !internationalPassportExpiration.isEmpty {
                        filled = true
                    } else {
                        filled = false
                    }
                }
                
                FloatingTextField(
                    text: $internationalPassportExpiration,
                    placeholder: "Срок действия загранпаспорта",
                    keyboard: .emailAddress
                )
                .onChange(of: internationalPassportExpiration) {
                    if !name.isEmpty && !surname.isEmpty && !birthDate.isEmpty && !citizenship.isEmpty && !internationalPassportNumber.isEmpty && !internationalPassportExpiration.isEmpty {
                        filled = true
                    } else {
                        filled = false
                    }
                }
            }
        }
        .blockBackground(alignment: .center)
    }
}

#Preview {
    TouristBlock(title: "", filled: .constant(false))
}
