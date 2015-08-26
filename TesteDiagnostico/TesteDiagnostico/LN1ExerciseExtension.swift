//
//  LN1ExerciseExtension.swift
//  TesteDiagnostico
//
//  Created by Kaique Damato on 8/20/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

import UIKit

class LN1ExerciseExtension: NSObject {
    
    let firstPhrase = "Ela soube que o advogado dele meteu um processo após o acidente."
    let secondPhrase = "As meninas a quem deram muitos doces ficaram com dores de barriga."
   
    func getPhrases() -> [String] {
        let phrases = [firstPhrase, secondPhrase]
        return phrases
    }
}
