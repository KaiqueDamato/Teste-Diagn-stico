//
//  VSPoint.swift
//  TesteDiagnostico
//
//  Created by Emannuel Fernandes de Oliveira Carvalho on 8/4/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

import Foundation
import CoreData

class VSPoint: NSManagedObject {

    @NSManaged var x: NSNumber
    @NSManaged var y: NSNumber
    @NSManaged var radius: NSNumber
    @NSManaged var exercise: VS1Exercise
    @NSManaged var patientExercise: VS1Exercise

}
