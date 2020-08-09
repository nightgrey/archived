//
//  WeatherError.swift
//  Clima
//
//  Created by Nico Niebergall on 05.07.20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherError: Error {
    var userMessage: String
    
    init(userMessage: String) {
        self.userMessage = userMessage
    }
}
