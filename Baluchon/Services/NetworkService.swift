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
        let urlString = queryURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

        if let url = URL(string: urlString ?? queryURL) {
            let task = URLSession.shared.dataTask(with: url) {
                (data, response, error) in
                completionHandler(data)
            }
            task.resume()
        }
    }
}
