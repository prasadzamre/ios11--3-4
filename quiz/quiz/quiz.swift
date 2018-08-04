//
//  quiz.swift
//  quiz
//
//  Created by Prasad Zamre on 15/07/18.
//  Copyright © 2018 Prasad Zamre. All rights reserved.
//

import UIKit
import Firebase

class quiz: UIViewController {
    
    let allquestion = QuestionBank()
    var pickAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let firstquestion = allquestion.list[0]
        questionLabel.text = firstquestion.questionText
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(_ sender: AnyObject) {
      
        if sender.tag == 1{
            pickAnswer = true
        }
        else  if sender.tag == 2 {
            pickAnswer = false
            
        }
        checkAnswer()
        questionNumber = questionNumber + 1
        
        nextQuestion()
        
        
    }
    
    func updateUI() {
        
        scoreLabel.text = "score:- \(score)"
        progressLabel.text = "\(questionNumber + 1) /13"
        
        
        
    }
    
    
    func nextQuestion() {
        if questionNumber <= 12{
            questionLabel.text = allquestion.list[questionNumber].questionText
            
            updateUI()
        }
        else{
            
            let alert = UIAlertController(title: "Awesome", message: "you have finish all question willl you like to start over", preferredStyle: .alert)
            
            let restarAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restarAction)
            present(alert,animated: true,completion: nil)
        }
        
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allquestion.list[questionNumber].answer
        
        if correctAnswer == pickAnswer{
           // ProgressHUD.showSuccess("Correct")
            
            score += 1
        }
        else{
           // ProgressHUD.showError("Wrong !")
            
        }
    }
    
    
    func startOver() {
        let finalScore = ["User"  : Auth.auth().currentUser?.email , "Score" : "\(score)"]
        print(finalScore)
        
        // saving score to firebase
        
        let dB = Database.database().reference().child("Score")
        // udating score and sycnorying it
        
        dB.childByAutoId().setValue(finalScore)
        
        
        
        questionNumber = 0
        nextQuestion()
        score = 0
        
        updateUI()
    }
    
    
    
}

        
    
    

