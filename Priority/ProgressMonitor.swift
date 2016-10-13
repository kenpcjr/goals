//
//  ProgressMonitor.swift
//  Priority
//
//  Created by Kenneth Cooke on 8/1/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import Foundation
import CoreData


class ProgressMonitor: NSManagedObject {
    
    // Insert code here to add functionality to your managed object subclass
    
    var currentSavingsTotal: Double {
        
        guard let giveUpItem = self.giveUpItem, let sacrifices = numberOfSacrifices else {return 0}
        
        
        return Double(sacrifices) * Double(giveUpItem.cost!)
        
    }
    
    var isGoalAcheived: Bool {
        
        guard let goal = self.goal, let cost = goal.cost else {return false}
        
        return self.currentSavingsTotal >= Double(cost)
        
    }
    
    var dollarsToGoal: Double? {
        
        guard let goal = self.goal, let cost = goal.cost else {return nil}
        
        return Double(cost) - self.currentSavingsTotal
        
    }
    
    var initialDaysToGoal: Double? {
        
        
        guard let goal = self.goal, let giveUpItem = self.giveUpItem, let cost = goal.cost else { return nil }
        
        if Double(giveUpItem.frequency!) > 30 {
            
            let frequency = Double(giveUpItem.frequency!) / 10000.00
            
            let daysToGo = Double(cost) / (Double(giveUpItem.cost!) * Double(frequency))
            
            return Double(daysToGo)
            
        } else {
            
            
            let daysToGo = Double(cost) / (Double(giveUpItem.cost!) * Double(giveUpItem.frequency!))
            
            print("cost: \(cost), giveUpCost:\(giveUpItem.cost!), giveUpItemFrequency \(giveUpItem.frequency!) = Days to go: \(daysToGo)")
            
            return ceil(daysToGo)
            
        }
        
        
        
    }
    
    var sacrificesToGoal: Int? {
        
        guard let item = giveUpItem, let dollarsToGoal = self.dollarsToGoal else {return nil}
        
        return Int(ceil(dollarsToGoal / Double(item.cost!)))
        
    }
    
}
