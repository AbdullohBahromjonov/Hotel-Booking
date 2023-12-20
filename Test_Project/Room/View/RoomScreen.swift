//
//  RoomScreen.swift
//  Test_Project
//
//  Created by Abdulloh on 17/12/23.
//

import SwiftUI

struct RoomScreen: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    
    @Binding var hotelName: String
    
    var body: some View {
        ScreenBackground(title: hotelName) {
            if let safeRooms = viewModel.rooms {
                ScrollView(showsIndicators: false) {
                    ForEach(safeRooms.rooms) { room in
                        RoomBlock(room: .constant(room))
                    }
                    .padding(.vertical)
                }
            } else {
                ProgressView()
            }
        }
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
        .onAppear {
            viewModel.getRooms()
        }
    }
}

#Preview {
    NavigationView {
        RoomScreen(hotelName: .constant("Hotel"))
            .environmentObject(ViewModel())
    }
}
