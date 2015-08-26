//
//  ViewController.swift
//  TesteDiagnostico
//
//  Created by Kaique Damato on 8/4/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var blueView: UIView!
    
    lazy var views: [UIView!] = {
        var viewsArray = [self.blueView, self.greenView, self.redView]
        return viewsArray
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func moveRight(sender: UISwipeGestureRecognizer) {
        moveRight()
    }
    
    @IBAction func moveLeft(sender: UISwipeGestureRecognizer) {
        moveLeft()
    }
    
    func moveRight() {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.blueView.frame = CGRect(x: self.blueView.frame.origin.x + 300, y: self.blueView.frame.origin.y, width: 300, height: 300)
            self.greenView.frame = CGRect(x: self.greenView.frame.origin.x + 300, y: self.greenView.frame.origin.y, width: 300, height: 300)
            self.redView.frame = CGRect(x: self.redView.frame.origin.x + 300, y: self.redView.frame.origin.y, width: 300, height: 300)
        })
    }
    
    func moveLeft() {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.blueView.frame = CGRect(x: self.blueView.frame.origin.x - 300, y: self.blueView.frame.origin.y, width: 300, height: 300)
            self.greenView.frame = CGRect(x: self.greenView.frame.origin.x - 300, y: self.greenView.frame.origin.y, width: 300, height: 300)
            self.redView.frame = CGRect(x: self.redView.frame.origin.x - 300, y: self.redView.frame.origin.y, width: 300, height: 300)
        })
    }

}

