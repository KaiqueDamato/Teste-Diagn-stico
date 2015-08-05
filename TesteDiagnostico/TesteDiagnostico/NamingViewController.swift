//
//  NamingViewController.swift
//  
//
//  Created by Kaique Damato on 8/4/15.
//
//

import UIKit

class NamingViewController: UIViewController {
    
    let animals = ["cavalo", "porco", "canguru"]
    var answers = [NSInteger]()
    var counter = 0

    @IBOutlet weak var animalImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateView()
    }

    @IBAction func rightAnswer() {
        answers.append(1)
        counter++
        configurateView()
    }
    
    @IBAction func wrongAnswer() {
        answers.append(0)
        counter++
        configurateView()
    }
    
    func configurateView() {
        if counter < 3 {
            imageAnimation()
        } else {
            calculateScore()
        }
    }
    
    func calculateScore() {
        var finalScore = 0
        for score in answers {
            finalScore = finalScore + score
        }
        print(finalScore)
    }
    
    func imageAnimation() {
        UIView.animateWithDuration(1.5, animations: { () -> Void in
            self.animalImageView.alpha = 0
            var image = NSBundle.mainBundle().pathForResource(self.animals[self.counter], ofType: "png")
            self.animalImageView.image = UIImage(contentsOfFile: image!)
            self.animalImageView.alpha = 1
        })
    }

}
