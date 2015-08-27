//
//  MM1ExerciseTableViewController.swift
//  TesteDiagnostico
//
//  Created by Kaique Damato on 8/6/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

import UIKit
import AVFoundation

class MM1ExerciseTableViewController: UITableViewController {

    @IBOutlet weak var wordOneButton: KPButton!
    @IBOutlet weak var wordTwoButton: KPButton!
    @IBOutlet weak var wordThreeButton: KPButton!
    @IBOutlet weak var wordFourButton: KPButton!
    @IBOutlet weak var wordFiveButton: KPButton!
    @IBOutlet weak var nextButton: KPButton!
    
    @IBOutlet weak var answerOneButton: KPButton!
    @IBOutlet weak var answerTwoButton: KPButton!
    @IBOutlet weak var answerThreeButton: KPButton!
    @IBOutlet weak var answerFourButton: KPButton!
    @IBOutlet weak var answerFiveButton: KPButton!
    
    var memoryModel = MM1ExerciseExtension()
    var buttons = [UIButton]()
    var answerButtons = [UIButton]()
    var touchesSequence = [String]()
    
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [wordOneButton, wordTwoButton, wordThreeButton, wordFourButton, wordFiveButton]
        answerButtons = [answerOneButton, answerTwoButton, answerThreeButton, answerFourButton, answerFiveButton]
        self.configurateButtons()
    }
    
    func configurateButtons() {
        var words = memoryModel.getWords()
        
        for var index = 0; index < words.count; index++ {
            buttons[index].setTitle(words[index], forState: UIControlState.Normal)
        }
    }

    @IBAction func buttonTouched(sender: KPButton) {
        var numberButton = sender.tag
        var currentWord = buttons[numberButton].currentTitle!
        
        touchesSequence.append(currentWord)
        
        var nextNumber = touchesSequence.count as NSNumber
        
        answerButtons[numberButton].setTitle(nextNumber.stringValue, forState: UIControlState.Normal)
        answerButtons[numberButton].backgroundColor = UIColor(red: 22/255, green: 142/255, blue: 234/255, alpha: 1)
        answerButtons[numberButton].enabled = false
        buttons[numberButton].enabled = false
        
        self.animateAnswers(numberButton, nextNumber: nextNumber)
    }
    
    @IBAction func textToSpeech(sender: KPButton) {
        var words = memoryModel.getWords()
        
        for word in words {
            myUtterance = AVSpeechUtterance(string: word)
            myUtterance.rate = 0.1
            myUtterance.postUtteranceDelay = 0.6
            synth.speakUtterance(myUtterance)
        }
    }
    
    func animateAnswers(buttonTag: NSInteger, nextNumber: NSNumber) {
        self.answerButtons[buttonTag].transform = CGAffineTransformMakeScale(0.8, 0.8)
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 4.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.answerButtons[buttonTag].transform = CGAffineTransformIdentity
        }, completion: nil)
    }
    
    @IBAction func nextTest() {
        //SALVAR O ARRAY TOUCHESSEQUENCE E A SEQUÊNCIA DAS PALAVRAS NO BANCO DE DADOS
        self.synth.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
        
        for var index = 0; index < buttons.count; index++ {
            answerButtons[index].setTitle(" ", forState: UIControlState.Normal)
            answerButtons[index].backgroundColor = UIColor.whiteColor()
            buttons[index].enabled = true
            answerButtons[index].enabled = true
        }
        touchesSequence.removeAll(keepCapacity: false)
    }
    
    
}
