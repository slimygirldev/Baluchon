//
//  WeatherModel.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/11/2022.
//

import Foundation
// ToDo Error Handling 
struct WeatherModel {
    var cityName: String

    var temp: Double
    var temp_min: Double
    var temp_max: Double
    var humidity: Int

    var mainWeatherDescription: String


    init?(json: [String: Any]) {
// deserialization
        guard let mainData: [String: Any] = json["main"] as? [String: Any] else {
            print("failed to get main data")
            return nil
        }

        guard let weatherData: [String: Any] = (json["weather"] as? [Any])?.first as? [String : Any] else {
            print("failed to get weather data")
            return nil
        }

        guard let cityName: String = json["name"] as? String else {
            print("failed to get city name")
            return nil
        }

        self.cityName = cityName
        self.temp = mainData["temp"] as? Double ?? 0
        self.temp_min = mainData["temp_min"] as? Double ?? 0
        self.temp_max = mainData["temp_max"] as? Double ?? 0
        self.humidity = mainData["humidity"] as? Int ?? 0
        self.mainWeatherDescription = (weatherData["description"] as? String)?.capitalized ?? ""
    }
}
