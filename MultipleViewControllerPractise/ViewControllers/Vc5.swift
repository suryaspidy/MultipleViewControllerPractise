//
//  Vc5.swift
//  MultipleViewControllerPractise
//
//  Created by surya-zstk231 on 24/05/21.
//

import UIKit

class Vc5: UIViewController {

    @IBOutlet weak var questionArea: UILabel!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionNoLabel: UILabel!
    var questions = QusAnsSaved().question.shuffled()
    
    
    var currentQuestion = 0
    var answerdQuestions = 1
    var totalUserScore = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        
        decorativeElements()
        printQuestion()
        
        
    }
    
    @objc func printQuestion(){
        if answerdQuestions <= questions.count {
            questionArea.text = questions[currentQuestion].ques
            trueBtn.backgroundColor = .systemYellow
            falseBtn.backgroundColor = .systemYellow
            scoreLabel.text = "Your score \(totalUserScore)"
            questionNoLabel.text = "Question No \(answerdQuestions)"
        }else{
            questionArea.text = "Game Finish Your Total Score is \(totalUserScore)"
            scoreLabel.text = "Your score \(totalUserScore)"
            questionNoLabel.alpha = 0
            trueBtn.alpha = 0
            falseBtn.alpha = 0
            
            Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(reloadGame), userInfo: nil, repeats: false)
        }
    }
    
    
    
    @IBAction func ansBtnTapped(_ sender: UIButton) {
        
        if answerdQuestions <= questions.count {
        
            guard let urAns = sender.titleLabel?.text else {return}
            
            if urAns == questions[currentQuestion].ans{
                sender.backgroundColor = .green
                totalUserScore += 1
            }else{
                sender.backgroundColor = .red
                totalUserScore -= 1
            }
        
            currentQuestion += 1
            answerdQuestions += 1
            
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(printQuestion), userInfo: nil, repeats: false)
    }
    }
    
    func decorativeElements(){
        
        trueBtn.layer.cornerRadius = trueBtn.frame.height/3
        falseBtn.layer.cornerRadius = falseBtn.frame.height/3
    }
    
    @IBAction func reloadBtnTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Reload Game", message: "If you reload game erase all current score automatically", preferredStyle: .alert)
        let action = UIAlertAction(title: "Reload", style: .default) { (alert) in
            self.reloadGame()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func reloadGame(){
        currentQuestion = 0
        answerdQuestions = 1
        totalUserScore = 0
        questionNoLabel.alpha = 1
        trueBtn.alpha = 1
        falseBtn.alpha = 1
        questions = QusAnsSaved().question.shuffled()
        decorativeElements()
        printQuestion()
    }
}

