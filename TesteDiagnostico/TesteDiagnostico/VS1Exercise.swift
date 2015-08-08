//
//  VS1Exercise.swift
//  TesteDiagnostico
//
//  Created by Emannuel Fernandes de Oliveira Carvalho on 8/4/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class VS1Exercise: NSManagedObject {

    @NSManaged var evaluation: NSNumber
    @NSManaged var points: NSSet
    @NSManaged var patientPoints: NSSet
    var pointsArray = [CGPoint]()

}
