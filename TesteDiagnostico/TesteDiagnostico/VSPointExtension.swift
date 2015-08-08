//
//  VSPointExtension.swift
//  TesteDiagnostico
//
//  Created by Emannuel Fernandes de Oliveira Carvalho on 8/4/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension VSPoint {
    class func pointWithCGPoint(point: CGPoint) -> VSPoint? {
        if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
            if let context = appDelegate.managedObjectContext {
                if let entity = NSEntityDescription.entityForName("VSPoint", inManagedObjectContext: context) {
                    let newPoint = VSPoint(entity: entity, insertIntoManagedObjectContext: context)
                    newPoint.x = point.x
                    newPoint.y = point.y
                    newPoint.radius = 20
                    context.save(nil)
                    return newPoint
                }
            }
        }
        return nil
    }
    
    class func getAllPoints() -> [VSPoint]? {
        if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
            if let context = appDelegate.managedObjectContext {
                let fetchRequest = NSFetchRequest(entityName: "VSPoint")
                var error: NSError?
                if let results = context.executeFetchRequest(fetchRequest, error: &error) as? [VSPoint] {
                    return results
                } else if error != nil {
                    println(error)
                }
            }
        }
        return nil
    }
}

extension CGPoint {
    init(_ point: VSPoint) {
        x = CGFloat(point.x)
        y = CGFloat(point.y)
    }
}