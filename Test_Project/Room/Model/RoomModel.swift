//
//  RoomModel.swift
//  Test_Project
//
//  Created by Abdulloh on 17/12/23.
//

import Foundation

struct Rooms: Decodable {
    let rooms: [Room]
}

struct Room: Decodable, Identifiable {
    let id: Int
    let name: String
    let price: Int
    let price_per: String
    let peculiarities: [String]
    let image_urls: [String]
}
