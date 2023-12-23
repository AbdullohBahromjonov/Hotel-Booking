//
//  AddTouristBlock.swift
//  Test_Project
//
//  Created by Abdulloh on 22/12/23.
//

import SwiftUI

struct AddTouristBlock: View {
    @Binding var touristsNumber: Int
    
    var body: some View {
        HStack {
            Text("Добавить туриста")
                .title()
            
            Spacer()
            
            Button(
                action: {
                    withAnimation {
                        touristsNumber += 1
                    }
                },
                label: {
                    Image(systemName: "plus")
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
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
}

#Preview {
    AddTouristBlock(
        touristsNumber: .constant(1)
    )
}
