//
//  CustomListItem.swift
//  Test_Project
//
//  Created by Abdulloh on 16/12/23.
//

import SwiftUI

struct CustomListItem: View {
    let iconName: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: iconName)
                .font(.system(size: 24))
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                Text(description)
                    .foregroundColor(Color.textSecondary)
                    .font(.system(size: 14, weight: .medium))
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 20))
        }
        .frame(height: 40)
    }
}

#Preview {
    CustomListItem(
        iconName: "face.smiling",
        title: "Удобства",
        description: "Самое необходимое"
    )
    .padding()
}
