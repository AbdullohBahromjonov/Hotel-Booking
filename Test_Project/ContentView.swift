//
//  ContentView.swift
//  Test_Project
//
//  Created by Abdulloh on 16/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            HotelScreen()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}
