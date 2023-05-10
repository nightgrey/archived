//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var heightSlider: UISlider!
    @IBOutlet var weightSlider: UISlider!
    
    var calculatorBrain : CalculatorBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        calculatorBrain = CalculatorBrain(height: heightSlider.value, weight: weightSlider.value)
        updateUi()
    }
    
    func updateUi() {
        if let safeFormattedHeight = calculatorBrain?.getFormattedHeight() {
            heightLabel.text = "\(safeFormattedHeight)m"
        }
        
        if let safeFormattedWeight = calculatorBrain?.getFormattedWeight() {
            weightLabel.text = "\(safeFormattedWeight)kg"
        }
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        calculatorBrain?.height = sender.value
        updateUi()

    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        calculatorBrain?.weight = sender.value
        updateUi()
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destionationView = segue.destination as! ResultsViewController
            destionationView.calculatorBrain = calculatorBrain
        }
    }
}

