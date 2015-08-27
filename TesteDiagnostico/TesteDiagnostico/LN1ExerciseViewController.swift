//
//  LN1ExerciseViewController.swift
//  TesteDiagnostico
//
//  Created by Kaique Damato on 8/20/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

import UIKit
import AVFoundation

class LN1ExerciseViewController: UIViewController {
    
    let languageModel = LN1ExerciseExtension()
    
    @IBOutlet var voiceButtons: [KPButton]!
    
    @IBOutlet weak var correctOneButton: KPButton!
    @IBOutlet weak var correctTwoButton: KPButton!
    
    @IBOutlet weak var wrongOneButton: KPButton!
    @IBOutlet weak var wrongTwoButton: KPButton!
    
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
    var pointsInExerciseOne = 0
    var pointsInExerciseTwo = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func textToSpeech(sender: KPButton) {
        let phrases = languageModel.getPhrases()
        
        myUtterance = AVSpeechUtterance(string: phrases[sender.tag])
        myUtterance.rate = 0.1
        myUtterance.postUtteranceDelay = 0.6
        synth.speakUtterance(myUtterance)
    }
    
    @IBAction func firstAnswer(sender: KPButton) {
        pointsInExerciseOne = sender.tag
        
        if sender.tag == 1 {
            sender.backgroundColor = UIColor(red: 0/255, green: 175/255, blue: 240/255, alpha: 1)
            wrongOneButton.backgroundColor = UIColor(red: 142/255, green: 200/255, blue: 63/255, alpha: 1)
        } else if sender.tag == 0 {
            sender.backgroundColor = UIColor(red: 0/255, green: 175/255, blue: 240/255, alpha: 1)
            correctOneButton.backgroundColor = UIColor(red: 142/255, green: 200/255, blue: 63/255, alpha: 1)
        }
    }

    @IBAction func secondAnswer(sender: KPButton) {
        pointsInExerciseTwo = sender.tag
        
        if sender.tag == 1 {
            sender.backgroundColor = UIColor(red: 0/255, green: 175/255, blue: 240/255, alpha: 1)
            wrongTwoButton.backgroundColor = UIColor(red: 142/255, green: 200/255, blue: 63/255, alpha: 1)
        } else if sender.tag == 0 {
            sender.backgroundColor = UIColor(red: 0/255, green: 175/255, blue: 240/255, alpha: 1)
            correctTwoButton.backgroundColor = UIColor(red: 142/255, green: 200/255, blue: 63/255, alpha: 1)
        }
    }
}
