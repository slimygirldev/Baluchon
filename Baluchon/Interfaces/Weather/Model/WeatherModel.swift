//
//  WeatherModel.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/11/2022.
//

import Foundation
import UIKit
// ToDo Error Handling
enum City: Int {
    case paris = 6455259
    case newYork = 5128581
    case copenhagen = 2618425
}


enum BackgroundColors {
    case dawn
    case day
    case dusk
    case night

    var matchingColors: [CGColor] {
        switch self {
        case .dawn:
            let colorTwo = CGColor(red: 0.9725, green: 0.698, blue: 0.5451, alpha: 1.0)
            let colorOne = CGColor(red: 0.2, green: 0.1608, blue: 0.6588, alpha: 1.0)
            return [colorOne, colorTwo]
        case .day:
            let colorOne = CGColor(red: 0.4941, green: 0.7569, blue: 1, alpha: 1.0)
            let colorTwo = CGColor(red: 0.0275, green: 0.3843, blue: 0.8, alpha: 1.0)
            return [colorOne, colorTwo]
        case .dusk:
            let colorTwo = CGColor(red: 1, green: 0.7686, blue: 0.7176, alpha: 1.0)
            let colorOne = CGColor(red: 0.0549, green: 0.2667, blue: 0.5882, alpha: 1.0)
            return [colorOne, colorTwo]
        case .night:
            let colorOne = CGColor(red: 0.0902, green: 0.1882, blue: 0.4353, alpha: 1.0)
            let colorTwo = CGColor(red: 0, green: 0.0941, blue: 0.2392, alpha: 1.0)
            return [colorOne, colorTwo]
        }
    }
}

struct WeatherModel {
    var cityName: String

    var temp: Double
    var tempMin: Double
    var tempMax: Double
    var humidity: Double

    var mainWeatherDescription: String


    func setBackgroundColor() -> [CGColor] {
        let hour = Calendar.current.component(.hour, from: Date())

        if hour >= 4 && hour <= 8 {
            return BackgroundColors.dawn.matchingColors
        } else if hour >= 9 && hour <= 15 {
            return BackgroundColors.day.matchingColors
        } else if hour >= 15 && hour <= 19 {
            return BackgroundColors.dusk.matchingColors
        } else {
            return BackgroundColors.night.matchingColors
        }
    }
}
