//
//  WeatherManager.swift
//  Clima
//
//  Created by Nico Niebergall on 04.07.20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didFetchWeather(_ weatherModel: WeatherModel)
    func didFailWithError(_ error: WeatherError)
}

struct WeatherManager {
    let apiUrl = "https://api.openweathermap.org/data/2.5/weather?appid=5588bf88fea346b307eb3ccb8292aa41&units=metric"

    var delegate : WeatherManagerDelegate?
    
    func fetchWeather(city: String) {
        performRequest(with: "\(apiUrl)&q=\(city)")
    }
    
    func fetchWeather(latitude: Double, longitude: Double) {
        performRequest(with: "\(apiUrl)&lat=\(latitude)&lon=\(longitude)")
    }
    
    func performRequest(with url: String) {
        if let url = URL(string: url) {
            let session = URLSession(configuration: .default)

            let task = session.dataTask(with: url) { (data, response, error) in
                if (error != nil) {
                    self.delegate?.didFailWithError(WeatherError(userMessage: "The server apparently disappeared in the clouds. 🤷‍♂️"))
                }

                if let safeData = data {
                    let decoder = JSONDecoder()

                    do {
                        let decodedData = try decoder.decode(WeatherData.self, from: safeData)
                        let weatherModel = WeatherModel(cityName: decodedData.name, temperature: decodedData.main.temp, conditionId: decodedData.weather[0].id)

                        self.delegate?.didFetchWeather(weatherModel)
                    } catch {
                        self.delegate?.didFailWithError(WeatherError(userMessage: "Sorry, the given city doesn't exist."))
                    }
                }
            }

            task.resume()
        } else {
            self.delegate?.didFailWithError(WeatherError(userMessage: "Sorry, something went wrong!"))
        }
    }
    
    //    func fetchWeather(city: String, completionHandler: @escaping (_ weatherModel: WeatherModel?, _ error: WeatherError?) -> Void) {
    //        if let url = URL(string: "\(apiUrl)&q=\(city)") {
    //            let session = URLSession(configuration: .default)
    //
    //            let task = session.dataTask(with: url) { (data, response, error) in
    //                if (error != nil) {
    //                    completionHandler(nil, WeatherError(userMessage: "Weather API could not be fetched."))
    //                }
    //
    //                if let safeData = data {
    //                    let decoder = JSONDecoder()
    //
    //                    do {
    //                        let decodedData = try decoder.decode(WeatherData.self, from: safeData)
    //                        let weatherModel = WeatherModel(cityName: decodedData.name, temperature: decodedData.main.temp, conditionId: decodedData.weather[0].id)
    //
    //                        completionHandler(weatherModel, nil)
    //                    } catch {
    //                        completionHandler(nil, WeatherError(userMessage: "Sorry, the city \"\(city)\" doesn't exist."))
    //                    }
    //                }
    //            }
    //
    //            task.resume()
    //        }
    //    }
        
}
