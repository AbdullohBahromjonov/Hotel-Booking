//
//  GetBooking.swift
//  Test_Project
//
//  Created by Abdulloh on 20/12/23.
//

import Foundation

extension ViewModel {
    func getBookingDetails() {
        guard let url = URL(string: "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedData = try JSONDecoder().decode(BookingDetails.self, from: data)
                        self.bookingDetails = decodedData
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
}
