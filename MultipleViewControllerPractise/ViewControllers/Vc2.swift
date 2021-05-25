//
//  Vc2.swift
//  MultipleViewControllerPractise
//
//  Created by surya-zstk231 on 24/05/21.
//

import UIKit

class Vc2: UIViewController {

    

    //MARK: initialise outlets
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var showTimeLable: UILabel!
    
    //MARK: initialise variables
    var eggTime = ["Soft":300, "Medium":420, "Hard":720]
    var totalTime:Int!
    var progTime:Int = 0
    var secondsRemaining:Int!
    var timeManager = Timer()
    var progManager = Timer()
    
    //MARK: actions
    @IBAction func clickEgg(_ sender: Any) {
        //MARK: show time in lable
        timeManager.invalidate()
        let hardness = (sender as AnyObject).currentTitle!
        secondsRemaining = eggTime[hardness!]!
        
       timeManager = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
    
        //MARK: show time in progressbar
        progManager.invalidate()
        progressView.progress = 0
        totalTime = eggTime[hardness!]!
        
        progManager = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateProgView), userInfo: nil, repeats: true)
        
    }
    
    //MARK: objc actions
    @objc func updateTime(){
        if secondsRemaining >= 0 {
            showTimeLable.text = String(secondsRemaining)
            secondsRemaining -= 1
        }
        else{
            showTimeLable.text = "Time up"
            timeManager.invalidate()
        }
    }
    
    @objc func updateProgView(){
        if progTime == totalTime{
            progressView.progress = 1
        }
        else if progTime < totalTime {
            let percentage = Float(progTime) / Float(totalTime)
            print(percentage)
            progressView.progress = percentage
            progTime += 1
        }else{
            progManager.invalidate()
        }
    }
}
    
