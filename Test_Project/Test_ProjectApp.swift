//
//  Test_ProjectApp.swift
//  Test_Project
//
//  Created by Abdulloh on 16/12/23.
//

import SwiftUI

@main
struct Test_ProjectApp: App {
    var viewModel = ViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(Color.white)
    }
    
    var body: some Scene {
        WindowGroup {
            HotelScreen()
                .environmentObject(viewModel)
        }
    }
}
