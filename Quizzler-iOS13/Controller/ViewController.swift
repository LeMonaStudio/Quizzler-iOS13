//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var currentScoreText: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var buttonA: UIButton!
    
    @IBOutlet weak var buttonB: UIButton!
    
    @IBOutlet weak var buttonC: UIButton!
    
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

     
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        sender.backgroundColor = quizBrain.checkAnswerForUIUpdate(userAnswer)
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    @objc func updateUI(){
        currentScoreText.text = "Score: \(quizBrain.getCurrentScore())"
        questionText.text = quizBrain.getCurrentQuestionText()
        progressView.progress = quizBrain.getProgress()
        
        buttonA.setTitle(quizBrain.getAnswerOptions(option: 1), for: .normal)
        buttonB.setTitle(quizBrain.getAnswerOptions(option: 2), for: .normal)
        buttonC.setTitle(quizBrain.getAnswerOptions(option: 3), for: .normal)
        
        buttonA.backgroundColor = UIColor.clear
        buttonB.backgroundColor = UIColor.clear
        buttonC.backgroundColor = UIColor.clear
    }
    
}

