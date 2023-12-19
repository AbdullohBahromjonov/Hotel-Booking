//
//  BookingScreen.swift
//  Test_Project
//
//  Created by Abdulloh on 17/12/23.
//

import SwiftUI

struct BookingScreen: View {
    @Environment(\.dismiss) var dismiss
    
    @FocusState var isFocused: Bool
    
    let a = "examplemail@mail.ru"
    
    var body: some View {
        ZStack {
            Color("Background")
                .edgesIgnoringSafeArea(.bottom)
            
            ScrollView {
                HotelBlock()
                
                VStack(alignment: .leading, spacing: 19) {
                    BookingDetailItem(
                        placeholder: "Вылет из",
                        text: "Санкт-Петербург"
                    )
                    
                    BookingDetailItem(
                        placeholder: "Страна, город",
                        text: "Египет, Хургада"
                    )
                    
                    BookingDetailItem(
                        placeholder: "Даты",
                        text: "19.09.2023 – 27.09.2023"
                    )
                    
                    BookingDetailItem(
                        placeholder: "Кол-во ночей",
                        text: "7 ночей"
                    )
                    
                    BookingDetailItem(
                        placeholder: "Отель",
                        text: "Steigenberger Makadi"
                    )
                    
                    BookingDetailItem(
                        placeholder: "Номер",
                        text: "Стандартный с видом на бассейн или сад"
                    )
                    
                    BookingDetailItem(
                        placeholder: "Питание",
                        text: "Все включено"
                    )
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                
                BuyerInfoBlock()
                    .focused($isFocused)
                
            }
        }
        .onTapGesture {
            isFocused = false
        }
        .navigationTitle("Бронирование")
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
    BookingScreen()
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

struct BuyerInfoBlock: View {
    @State var phoneNumber = ""
    @State var email = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Информация о покупателе")
                .font(.system(size: 22, weight: .medium))
            
            FloatingTextField(
                text: $phoneNumber,
                placeholder: "Номер телефона",
                keyboard: .numberPad, 
                phoneNumber: true
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
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
}
