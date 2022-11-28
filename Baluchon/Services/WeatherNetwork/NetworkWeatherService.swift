//
//  NetworkWeatherService.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 28/11/2022.
//
//TODO : throw les erreurs

import Foundation

class NetworkWeatherService {
    private let apiKey: String = "89cd991d90f7deccaa3a48bb75ca2045"
    private let weatherURL: String = "https://api.openweathermap.org/data/2.5/weather"

    func fetchWeather(for cityId: City, _ completion: @escaping ((WeatherModel) -> Void)) {

        let queryParameters: String = "?id=\(cityId.rawValue)&appid=\(apiKey)"
        let queryURL: String = weatherURL + queryParameters

        if let url = URL(string: queryURL) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error occured", error)
                }
                if let data = data {
                    do {
                        let weather = try JSONDecoder().decode(WeatherEntity.self, from: data)

                        let weatherModel = WeatherModel(cityName: weather.name,
                                                        temp: weather.main.temp,
                                                        tempMin: weather.main.tempMin,
                                                        tempMax: weather.main.tempMax,
                                                        humidity: weather.main.humidity,
                                                        mainWeatherDescription: weather.weather[0].description)
                        completion(weatherModel)
                    } catch let error {
                        print("Look HERE====>", error)
                    }
                }
            }.resume()
        }
    }

}
