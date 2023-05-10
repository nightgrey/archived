//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by Nico Niebergall on 30.06.20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var bmiLabel: UILabel!
    @IBOutlet var adviceLabel: UILabel!
    
    var calculatorBrain : CalculatorBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text = calculatorBrain?.getFormattedBmi()
        adviceLabel.text = calculatorBrain?.advice
        view.backgroundColor = calculatorBrain?.color
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
