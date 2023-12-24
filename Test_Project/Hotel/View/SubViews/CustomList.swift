//
//  CustomListView.swift
//  Test_Project
//
//  Created by Abdulloh on 16/12/23.
//

import SwiftUI

struct CustomList: View {
    var body: some View {
        VStack {
            CustomListItem(
                iconName: "face.smiling",
                title: "Удобства",
                description: "Самое необходимое"
            )
            
            Divider()
                .frame(alignment: .trailing)
            
            CustomListItem(
                iconName: "checkmark.square",
                title: "Удобства",
                description: "Самое необходимое"
            )
            
            Divider()
                .frame(alignment: .trailing)
            
            CustomListItem(
                iconName: "x.square",
                title: "Удобства",
                description: "Самое необходимое"
            )
        }
        .padding(.trailing)
        .padding(10)
        .background(Color.peculiarities)
        .cornerRadius(15)
        .padding(.top, 10)
    }
}

#Preview {
    CustomList()
        .padding()
}
