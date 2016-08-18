//
//  User.swift
//  Priority
//
//  Created by Kenneth Cooke on 8/1/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import Foundation
import CoreData


class User: NSManagedObject {
    
    // Insert code here to add functionality to your managed object subclass
    
    var tempGoal: Goal?
    
    
    var numberOfGoalsMet: Int {
        
        guard let complete = goalsComplete else {return 0}
        
        return complete.count
        
    }
    
    
    var lifetimeTotalSaved: Double {
        
        var sumTotal = 0.0
        
        if let inProgress = self.goalInProgress {
            
            sumTotal = inProgress.currentSavingsTotal
            
        }
        
        if let completed = self.goalsComplete {
            
            
            for monitor in completed {
                
                let monitorConverted =  monitor as! ProgressMonitor
                
                sumTotal += monitorConverted.currentSavingsTotal
                
            }
            
        }
        
        return sumTotal
        
    }
    
    var totalSacrifices: Int {
        
        var totalSacrifice = 0
        
        if let currentGoalSacrifices = self.goalInProgress?.numberOfSacrifices {
            
            totalSacrifice = Int(currentGoalSacrifices)
            
        }
        
        
        if let goalsComplete = self.goalsComplete {
            
            for monitor in goalsComplete {
                
                let progressMonitor = monitor as! ProgressMonitor
                
                totalSacrifice += Int(progressMonitor.numberOfSacrifices!)
                
            }
            
        }
        
        return totalSacrifice
        
    }
    
}
