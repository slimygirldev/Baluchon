//
//  NetworkService.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 20/11/2022.
//

import Foundation

// Make all the network calls of the app

class NetworkService {
    private let weatherAPIKey: String = ""
    private let weatherURL: String = "https://api.openweathermap.org/data/2.5/weather"
    // Meteo, translation, conversion

    func requestWeather(for city: String,
                        completionHandler: @escaping ((Data?) -> Void)) {
        let queryParameters: String = "?q=\(city)&appid=\(weatherAPIKey)"
        let queryURL: String = weatherURL + queryParameters

        if let url = URL(string: queryURL) {
            let task = URLSession.shared.dataTask(with: url) {
                (data, response, error) in
                completionHandler(data)
            }
            task.resume()
        }
    }
}
