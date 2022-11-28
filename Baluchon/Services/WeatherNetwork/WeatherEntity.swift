//
//  WeatherEntity.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 28/11/2022.
//

import Foundation
//representation JSON
struct WeatherEntity: Decodable {

    var name: String
    var main: Main
    var weather: [Weather]

    struct Weather: Decodable {
        var description: String
    }

    struct Main: Decodable {
        var temp: Double
        var tempMin: Double
        var tempMax: Double
        var humidity: Double

        enum CodingKeys: String, CodingKey {
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case temp
            case humidity
        }
    }
}

