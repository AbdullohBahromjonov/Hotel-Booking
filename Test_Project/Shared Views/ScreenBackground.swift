//
//  ScreenBackground.swift
//  Test_Project
//
//  Created by Abdulloh on 21/12/23.
//

import SwiftUI

struct ScreenBackground<Content: View>: View {
    let title: String
    
    @ViewBuilder let content: Content
    
    var body: some View {
        ZStack {
            Color("Background")
                .edgesIgnoringSafeArea(.bottom)
            
            content
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}
