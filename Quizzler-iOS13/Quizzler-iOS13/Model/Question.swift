//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Nico Niebergall on 28.06.20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var text: String,
    answer: Bool
    
    init(text: String, answer: Bool) {
        self.text = text
        self.answer = answer
    }
}
