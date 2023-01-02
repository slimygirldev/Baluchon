//
//  NetworkWeatherService.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 28/11/2022.
//
//TODO : throw les erreurs

import Foundation

class NetworkWeatherService: NetworkProtocol {
    var networkClient: URLSession
    private let apiKey: String = ""
    private let weatherURL: String = "https://api.openweathermap.org/data/2.5/weather"

    // injection of network client dependancy
    init(networkClient: URLSession = .shared) {
        self.networkClient = networkClient
    }

    func fetchWeather(for cityId: City, _ completion: @escaping ((WeatherModel?, Error?) -> Void)) {

        let queryParameters: String = "?id=\(cityId.rawValue)&appid=\(apiKey)"
        let queryURL: String = weatherURL + queryParameters

        self.request(for: queryURL, entityType: WeatherEntity.self) {
            data, error  in
            guard error == nil else {
                print("Error : \(error.debugDescription)")
                completion(nil, error)
                return
            }
            guard let jsonWeather = data else {
                return
            }

            let weatherModel = WeatherModel(cityName: jsonWeather.name,
                                            temp: jsonWeather.main.temp,
                                            tempMin: jsonWeather.main.tempMin,
                                            tempMax: jsonWeather.main.tempMax,
                                            humidity: jsonWeather.main.humidity,
                                            mainWeatherDescription: jsonWeather.weather[0].description)
            completion(weatherModel, nil)
        }
    }
}
