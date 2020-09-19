//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = 0.0
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer: sender.currentTitle!)
        
        
        if (userGotItRight) {
            print("You are correct")
            sender.backgroundColor = UIColor.systemGreen
            sender.layer.cornerRadius = 24
        } else {
            sender.backgroundColor = UIColor.systemRed
            sender.layer.cornerRadius = 24
            print("You are incorrect")
        }
        
        quizBrain.updateQuiz()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.layer.cornerRadius = 0
        falseButton.layer.cornerRadius = 0
    }
    

}

