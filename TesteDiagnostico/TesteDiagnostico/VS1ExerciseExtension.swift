//
//  VS1ExerciseExtension.swift
//  TesteDiagnostico
//
//  Created by Emannuel Fernandes de Oliveira Carvalho on 8/4/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

import Foundation
import UIKit

extension VS1Exercise {
    
    func createPoints() {
        let x = [30, 40, 20, 40, 55, 60, 70, 70, 50, 40]
        let y = [70, 50, 30, 10, 35, 15, 35, 75, 70, 80]
        let strings = ["1", "A", "2", "B", "3", "C", "4", "D", "5", "E"]
        let scale = 4
        for i in Range(0..<x.count) {
            pointsArray.append(CGPoint(x: x[i] * scale, y: 30 + y[i] * scale))
        }
    }
    
    func addPoint(point: CGPoint) {
        let vsPoint = VSPoint.pointWithCGPoint(point)
        vsPoint?.exercise = self
    }
    
    func addPatientPoint(point: CGPoint) {
        let vsPoint = VSPoint.pointWithCGPoint(point)
        vsPoint?.patientExercise = self
    }
}