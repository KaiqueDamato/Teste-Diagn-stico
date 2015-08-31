//
//  CadastroViewController.swift
//  TesteDiagnostico
//
//  Created by Kaique Damato on 8/27/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController {
    
    var exerciseView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func registerDone() {
//        let width = self.view.bounds.width
//        let height = self.view.bounds.height
//        exerciseView = UIView(frame: CGRect(x: 0, y: 1100, width: width, height: height))
//        exerciseView.backgroundColor = UIColor.whiteColor()
//        self.view.addSubview(exerciseView)
        
//        UIView.animateWithDuration(0.5, animations: { () -> Void in
//            self.exerciseView.frame.origin.y = 0
//        }, completion: nil)
//        
//        var timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "newStoryBoard", userInfo: nil, repeats: false)
        
        let exerciseStoryBoard = UIStoryboard(name: "VisuospatialExecutive", bundle: nil)
        
        if let viewController = exerciseStoryBoard.instantiateInitialViewController() as? UIViewController {
            viewController.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
            presentViewController(viewController, animated: true, completion: nil)
        }
    }
    
    func newStoryBoard() {
        let exerciseStoryBoard = UIStoryboard(name: "VisuospatialExecutive", bundle: nil)
        
        if let viewController = exerciseStoryBoard.instantiateInitialViewController() as? UIViewController {
            viewController.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
            presentViewController(viewController, animated: true, completion: nil)
        }
//        view.removeFromSuperview()
    }
    

}
