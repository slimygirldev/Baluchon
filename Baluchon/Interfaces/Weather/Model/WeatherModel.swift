//
//  WeatherModel.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/11/2022.
//

import Foundation
// ToDo Error Handling
enum City: Int {
    case paris = 6455259
    case newYork = 5128581
}
struct WeatherModel {
    var cityName: String

    var temp: Double
    var tempMin: Double
    var tempMax: Double
    var humidity: Double

    var mainWeatherDescription: String
}
