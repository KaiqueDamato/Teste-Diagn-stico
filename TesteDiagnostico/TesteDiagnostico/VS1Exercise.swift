//
//  VS1Exercise.swift
//  TesteDiagnostico
//
//  Created by Emannuel Fernandes de Oliveira Carvalho on 8/8/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class VS1Exercise: NSManagedObject {

    @NSManaged var evaluation: NSNumber
    @NSManaged var patientPoints: NSSet
    @NSManaged var points: NSSet
    /* These point arrays are needed
    for the pre-CoreData phase */
    var pointsArray = [CGPoint]()
    var patientTouches = [CGPoint]()
}
