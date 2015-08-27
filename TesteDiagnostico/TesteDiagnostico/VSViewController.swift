//
//  VSViewController.swift
//  TesteDiagnostico
//
//  Created by Emannuel Fernandes de Oliveira Carvalho on 8/5/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

import UIKit

class VSViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var exercise: VS1Exercise?

    @IBOutlet weak var exerciseView: VS1View!
    
    override func viewDidLoad() {
        exercise = VS1Exercise()
        exercise?.createPoints()
    }
    
    let strings = ["1", "A", "2", "B", "3", "C", "4", "D", "5", "E"]
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let points = exercise?.pointsArray {
            for i in Range(0..<points.count) {
                createLabelWithText(strings[i], atPoint: points[i])
            }
        }
    }
    
    func createLabelWithText(text: String, atPoint point: CGPoint) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        label.center = point
        label.text = text
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 15
        label.textAlignment = .Center
        view.addSubview(label)
    }
    
    @IBAction func movedAround(sender: UIPanGestureRecognizer) {
        let point = sender.locationInView(exerciseView)
        exercise?.addPatientPoint(point)
        exerciseView.addPoint(point)
        exerciseView.setNeedsDisplay()
    }
    
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        println("Touches canceeeeled")
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        exerciseView.endStroke()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
