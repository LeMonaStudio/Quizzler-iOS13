//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Musa Lawrence on 3/14/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
import UIKit


struct QuizBrain{
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], c: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], c: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], c: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], c: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], c: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], c: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], c: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], c: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], c: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], c: "Australia")
    ]
    
    var questionNumber = 0
    var progress = Float(0)
    var currentScore = 0
    
    
    func getAnswerOptions(option: Int) -> String {
        return quiz[questionNumber].answer[option - 1]
    }

    mutating func checkAnswerForUIUpdate(_ userAnswer: String) -> UIColor {
        if (userAnswer == quiz[questionNumber].correctAnswer){
            currentScore += 1
            return UIColor.green
        }
        return UIColor.red
    }
    
    func getCurrentQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    mutating func nextQuestion() {
        questionNumber += 1
        if (!(questionNumber <= quiz.count - 1)){
            questionNumber = 0
            currentScore = 0
        }
    }
    
    func getCurrentScore() -> Int {
        return currentScore
    }
}
