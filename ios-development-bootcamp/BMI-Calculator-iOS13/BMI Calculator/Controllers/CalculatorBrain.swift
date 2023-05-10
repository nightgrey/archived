//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Nico Niebergall on 01.07.20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

class CalculatorBrain {
    var height: Float
    var weight: Float
    
    var bmi: Float {
        get {
            return weight / pow(height, 2.0)
        }
    }
    
    var advice: String {
        get {
            // < 18.5
            if bmi < 18.5 {
                return "MINIFETT"
            // 18.5 - 24.9
            } else if bmi <= 24.9 {
                return "MININORMAL"
            // > 24.9
            } else {
                return "MEGAFETT"
            }
        }
    }
    
    var color: UIColor {
        get {
            // < 18.5
            if bmi < 18.5 {
                return #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            // 18.5 - 24.9
            } else if bmi <= 24.9 {
                return #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
            // > 24.9
            } else {
                return #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            }
        }
    }
    
    init(height: Float?, weight: Float?) {
        self.height = height ?? 0.0
        self.weight = weight ?? 0.0
    }
    
    func getFormattedBmi() -> String {
        return String(format: "%.1f", bmi)
    }
    
    func getFormattedHeight() -> String {
        return String(format: "%.2f", height)
    }
    
    func getFormattedWeight() -> String {
        return String(Int(weight))
    }
}
