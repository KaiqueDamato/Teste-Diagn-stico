//
//  AT2ExerciseViewController.swift
//  TesteDiagnostico
//
//  Created by Kaique Damato on 8/17/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

import UIKit
import AVFoundation

class AT2ExerciseViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    @IBOutlet weak var correctAnswerButton: KPButton!
    @IBOutlet weak var wrongAnswerButton: KPButton!
    
    @IBOutlet weak var myAnimateView: UIView!
    
    var labels = [UILabel]()
    let attentionModel = AT2ExerciseExtension()
    
    var timer = NSTimer()
    var index = -1
    var scores = [Int]()
    
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showLetters()
    }
    
    func showLetters() {
        let words = attentionModel.getLetters()
        
        for var index = 0; index < labels.count; index++ {
            labels[index].text = words[index].uppercaseString
        }
    }
    
    @IBAction func textToSpeech() {
        let words = attentionModel.getLetters()
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "animateView:", userInfo: nil, repeats: true)
        
        for letter in words {
            self.speech(letter)
        }
    }
    
    func speech(letter: String) {
        myUtterance = AVSpeechUtterance(string: letter)
        myUtterance.rate = 0.1
        myUtterance.postUtteranceDelay = 0.8
        synth.speakUtterance(myUtterance)
    }

    @IBAction func correctAnswer() {
        scores.append(1)
    }
    
    @IBAction func wrongAnswer() {
        scores.append(0)
    }
    
    func animateView(timer: NSTimer) {
        if index == 27 {
            timer.invalidate()
        } else {
            index++
            let path = NSIndexPath(forRow: index, inSection: 0)
            let cell = myCollectionView.dequeueReusableCellWithReuseIdentifier("myCell", forIndexPath: path) as! MyCollectionViewCell
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                self.myAnimateView.frame = CGRectMake(cell.frame.origin.x+45, self.myAnimateView.frame.origin.y, 22, 8)
            }, completion: nil)
        }
    }
    
    // MARK: - CollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return attentionModel.getLetters().count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("myCell", forIndexPath: indexPath) as! MyCollectionViewCell
        
        // Configure the cell
        cell.myLabel.text = attentionModel.getLetters()[indexPath.row].uppercaseString
        
        
        return cell
    }
}
