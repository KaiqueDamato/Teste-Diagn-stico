//
//  AT3ExerciseTableViewController.swift
//  TesteDiagnostico
//
//  Created by Kaique Damato on 8/19/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

import UIKit

class AT3ExerciseTableViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet var myLabels: [KPLabel]!
    @IBOutlet var myTextFields: [UITextField]!
    
    let firstNumber = 80

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for textfield in myTextFields {
            textfield.delegate = self
        }
        
        myLabels[0].text = "80"
    }
    
    func calculateNextNumber(index: Int) {
        myLabels[index].text = myTextFields[index-1].text
    }
    

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        for var index = 0; index < myTextFields.count; index++ {
            if myTextFields[index].isFirstResponder() && index != 4{
                myTextFields[index+1].becomeFirstResponder()
                self.calculateNextNumber(index+1)
                return true
            } else {
                myTextFields[index].resignFirstResponder()
            }
        }
        return true
    }
    
}
