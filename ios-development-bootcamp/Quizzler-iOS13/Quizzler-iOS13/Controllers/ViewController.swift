//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    @IBOutlet var score: UILabel!
    
    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUi()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userIsRight = quizBrain.checkAnswer(userAnswer)
        
        if userIsRight {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }

        quizBrain.goToNextQuestion()
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false, block: { (Timer) -> () in
            self.updateUi()
        })
    }
    
    func updateUi() {
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        
        score.text = "Score: \(quizBrain.score) / \(quizBrain.quiz.count)"
        
        questionLabel.text = quizBrain.getCurrentQuestionText()
        progressBar.progress = quizBrain.progress
    }
}

