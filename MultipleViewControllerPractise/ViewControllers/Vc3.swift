//
//  Vc3.swift
//  MultipleViewControllerPractise
//
//  Created by surya-zstk231 on 24/05/21.
//

import UIKit
import AVFoundation

class Vc3: UIViewController {

    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnTapped(_ sender: UIButton) {
        let fileName:String = sender.currentTitle!
        playSound(Name: fileName)
    }
    
    func playSound(Name:String) {
            let url = Bundle.main.url(forResource: Name, withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
                    
        }
    

}
