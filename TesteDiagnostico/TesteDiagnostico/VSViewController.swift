//
//  VSViewController.swift
//  TesteDiagnostico
//
//  Created by Emannuel Fernandes de Oliveira Carvalho on 8/5/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

import UIKit

class VSViewController: UIViewController {
    
    var exercise: VS1Exercise?

    @IBOutlet weak var exerciseView: VS1View!
    
    override func viewDidLoad() {
        exercise = VS1Exercise()
        exercise?.createPoints()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func createLabelWithText(text: String, atPoint point: CGPoint) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        label.center = point
        view.addSubview(label)
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
