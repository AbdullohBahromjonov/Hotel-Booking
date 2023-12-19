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
        ZStack {
            Color("Background")
                .edgesIgnoringSafeArea(.bottom)
            
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
        .onAppear {
            viewModel.getRooms()
        }
        .navigationTitle(hotelName)
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
    RoomScreen(hotelName: .constant("Hotel"))
        .environmentObject(ViewModel())
}
