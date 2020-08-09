//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes: [String: Int] = [
        "Soft": 5,
        "Medium": 7,
        "Hard": 12
    ]
    
    var timeRemaining: Int = 0
    
    var timer: Timer = Timer()

    @IBOutlet var screenTitle: UILabel!
    
    @IBOutlet var progressView: UIProgressView!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        // Get time in seconds and set up timeRemaining`
        let timeInSeconds = eggTimes[hardness]! * 60
        timeRemaining = timeInSeconds
        
        // Invalidate timer & set progress to 0
        timer.invalidate()
        progressView.progress = 0.0
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.timeRemaining > 0 {
                
                self.progressView.progress = 1.0 - (Float(self.timeRemaining) / Float(timeInSeconds))
                
                self.timeRemaining -= 1
            } else {
                self.progressView.progress = 1.0
                Timer.invalidate()
                self.screenTitle.text = "Hurray! Done!"
            }
        }
    }

}
