//
//  WeatherModel.swift
//  Clima
//
//  Created by Nico Niebergall on 05.07.20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let cityName: String
    
    let temperature: Double
    var temperatureAsString: String {
        get {
            return String(format: "%.1f", temperature)
        }
    }
    
    let conditionId: Int
    var condition: String {
        get {
            switch conditionId {
                case 200...232:
                    return "cloud.bolt.rain.fill"
                case 300...321:
                    return "cloud.drizzle"
                case 500...531:
                    return "cloud.rain"
                case 600...622:
                    return "cloud.snow"
                case 701...781:
                    return "cloud.fog"
                case 800:
                    return "sun.max"
                case 801...804:
                    return "cloud.sun"
                default:
                    return "cloud"
            }
        }
    }
    
    init(cityName: String, temperature: Double, conditionId: Int) {
        self.cityName = cityName
        self.temperature = temperature
        self.conditionId = conditionId
    }
}
