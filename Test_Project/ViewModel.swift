//
//  ViewModel.swift
//  Test_Project
//
//  Created by Abdulloh on 16/12/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var hotel: Hotel? = nil
    @Published var rooms: Rooms? = nil
    @Published var bookingDetails: BookingDetails? = nil
}
