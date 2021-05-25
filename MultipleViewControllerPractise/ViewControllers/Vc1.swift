//
//  Vc1.swift
//  MultipleViewControllerPractise
//
//  Created by surya-zstk231 on 24/05/21.
//

import UIKit

class Vc1: UIViewController {

    
    @IBOutlet weak var diceOne: UIImageView!
    @IBOutlet weak var diceTwo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        view.backgroundColor = .red
//
//        let label = UILabel(frame: CGRect(x: (view.frame.width/2)-100, y: (view.frame.height/2)-10, width: 200, height: 20))
//        label.text = "ViewController 1"
//        label.tintColor = .black
//        view.addSubview(label)
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        let diceArr = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
        diceOne.image = diceArr[Int.random(in: 0...5)]
        diceTwo.image = diceArr[Int.random(in: 0...5)]
        
    }
    


}
