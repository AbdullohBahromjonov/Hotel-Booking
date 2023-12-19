//
//  HotelModel.swift
//  Test_Project
//
//  Created by Abdulloh on 16/12/23.
//

import Foundation

struct Hotel: Decodable, Identifiable {
    let id: Int
    let name: String
    let adress: String
    let minimal_price: Int
    let price_for_it: String
    let rating: Int
    let rating_name: String
    let image_urls: [String]
    let about_the_hotel: HotelInfo
}

struct HotelInfo: Decodable {
    let description: String
    let peculiarities: [String]
}
