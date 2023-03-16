## The App

You will program a trivia quiz app. If you have another field of expertise such as law or medicine, you’ll be glad to know that multiple choice question apps are one of the most popular types of educational apps on the App Store! 

## What I learnt

* How to programmatically change UI elements such as Labels and Buttons.
* What is a design pattern and how is it used in programming.
* How to use the Model-View-Controller or MVC pattern for app development.
* Learn about Swift Structures how to instantiate a struct instance.
* Understand the difference between value types and reference types. 
* Learn about Swift Classes and creating Objects.
* Compare Swift Classes with Swift Structs and know when to use which.
* Learn about Object Oriented Programming.
* How to refactor code and stay organised.



## Default Quiz

```
  Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
```

## Multiple Choice Quiz

```
 Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
```     

## What I did: The Code
Before refactoring the code to follow the MVC Design pattern, the ViewController.swift file handles all the data and logic and modifying the view.
However, the code became clearer and more organized after the refactoring. The UI elements are score text label, the question label and the True 
and False button which triggers the answerButtonPressed() function.

```swift
@IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        sender.backgroundColor = quizBrain.checkAnswerForUIUpdate(userAnswer)
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
}
```

The QuizBrain struct that handles the data and logic, contains regular and mutating methods that the Controller calls to modify the UI as 
the user interacts with the UI. The struct contains methods to check if user answer is correct or wrong, to get the user score, progress 
of the quiz and the next question to display on the screen.

```swift
struct QuizBrain{
    let quiz = [Question(q: "A slug's blood is green.", a: "True"),
                Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
                Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
                Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
                Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
                Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
                Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
                Question(q: "Google was originally called 'Backrub'.", a: "True"),
                Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
                Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
                Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
                Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    var questionNumber = 0
    var progress = Float()
    var currentScore = 0
    

    mutating func checkAnswerForUIUpdate(_ userAnswer: String) -> UIColor {
        if (userAnswer == quiz[questionNumber].answer){
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
```


https://user-images.githubusercontent.com/34939672/225242472-11d2ce74-c8ea-4020-9077-7adb659394c2.mov

</br>

### Optional Challenge
As optional challenge that was given in this code lab, I change the code to display multiple-choice questions and validate user answer with the UI
to show if the user is right or wrong, just like the True/False version.

First, I updated the Question struct to accomodate the new multiple-choice questions and then added the questions to the quiz array in the QuizBrain
struct.

```swift
//Before
struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}

//Now
struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], c: String) {
        text = q
        answer = a
        correctAnswer = c
    }
}
```

```swift
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
```

Then, I added a method in the QuizBrain struct to return the possible answers (.ie options) for the three buttons added to the view. When the updateUI() function is called, each of the button's title will be changed to the display the options as the question changes.

```swift
func getAnswerOptions(option: Int) -> String {
        return quiz[questionNumber].answer[option - 1]
}
```

```swift
buttonA.setTitle(quizBrain.getAnswerOptions(option: 1), for: .normal)
buttonB.setTitle(quizBrain.getAnswerOptions(option: 2), for: .normal)
buttonC.setTitle(quizBrain.getAnswerOptions(option: 3), for: .normal)
```
Finally, I updated the QuizBrain struct's checkAnswerForUIUpdate() method to check the if the user's selection is right or wrong.

```swift
//Before
mutating func checkAnswerForUIUpdate(_ userAnswer: String) -> UIColor {
        if (userAnswer == quiz[questionNumber].answer){
            currentScore += 1
            return UIColor.green
        }
        return UIColor.red
}
 
//Now
mutating func checkAnswerForUIUpdate(_ userAnswer: String) -> UIColor {
        if (userAnswer == quiz[questionNumber].correctAnswer){
            currentScore += 1
            return UIColor.green
        }
        return UIColor.red
}
```

</br>

https://user-images.githubusercontent.com/34939672/225590995-5cbcc96b-09cc-4a13-9e9f-d2353955044f.mov


### What's Next?
As I progress with my learning journey, I would love to update this mini project to be able to fetch quiz questions from a remote database, cache the questions in a local database and display in the app for users. I know it's a gradual process and I'm sure I'll get there 💪🏾💪🏾💪🏾.

</br>
</br>
>This is a companion project to The App Brewery's Complete App Development Bootcamp, check out the full course at [www.appbrewery.co](https://www.appbrewery.co/)

![End Banner](Documentation/readme-end-banner.png)
