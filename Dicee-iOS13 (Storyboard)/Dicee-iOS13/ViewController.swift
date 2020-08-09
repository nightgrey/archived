//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageViewLeft: UIImageView!
    
    @IBOutlet weak var diceImageViewRight: UIImageView!

    let diceArray = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix") ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        diceImageViewLeft.image = #imageLiteral(resourceName: "DiceOne")
        diceImageViewRight.image = #imageLiteral(resourceName: "DiceSix")
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        diceImageViewLeft.image = diceArray.randomElement()
        diceImageViewRight.image = diceArray.randomElement()
    }
}

