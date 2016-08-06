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
        
        guard let giveUpItem = self.giveUpItem, sacrifices = numberOfSacrifices else {return 0}
        
        //Watch this force unwrap
        
        return Double(sacrifices) * Double(giveUpItem.cost!)
        
    }
    
    var isGoalAcheived: Bool {
        
        guard let goal = self.goal, cost = goal.cost else {return false}
        
        return self.currentSavingsTotal >= Double(cost)
        
    }
    
    var dollarsToGoal: Double? {
        
        guard let goal = self.goal, cost = goal.cost else {return nil}
        
        return Double(cost) - self.currentSavingsTotal
        
    }
    
    var initialDaysToGoal: Int? {
        
        
        guard let goal = self.goal, giveUpItem = self.giveUpItem, cost = goal.cost else { return nil }
        
        let daysToGo = Double(cost) / (Double(giveUpItem.cost!) * Double(giveUpItem.frequency!))
        
        return Int(daysToGo)
        
    }
    
    var sacrificesToGoal: Int? {
        
        guard let item = giveUpItem, dollarsToGoal = self.dollarsToGoal else {return nil}
        
        return Int(dollarsToGoal / Double(item.cost!))
        
    }
    
}
