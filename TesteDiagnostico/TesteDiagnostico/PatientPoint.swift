//
//  PatientPoint.swift
//  TesteDiagnostico
//
//  Created by Emannuel Fernandes de Oliveira Carvalho on 8/8/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

import Foundation
import CoreData

class PatientPoint: NSManagedObject {

    @NSManaged var point: String
    @NSManaged var exercise: VS1Exercise

}
