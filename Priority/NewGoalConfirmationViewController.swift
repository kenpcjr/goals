//
//  NewGoalConfirmationViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 7/30/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit
import CoreData

class NewGoalConfirmationViewController: UIViewController {
    
    let dataStore = DataStore.sharedManager
    
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var goalItemLabel: UILabel!
 
    
    var progressMonitor: ProgressMonitor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(dataStore.userContainer[0].tempGoal?.name)
        print(dataStore.userContainer[0].tempGoal?.giveUpItem?.name)
        
        if let goal = dataStore.userContainer[0].tempGoal, giveItem = dataStore.userContainer[0].tempGoal!.giveUpItem {
            
            let newProgressMonitor = NSEntityDescription.insertNewObjectForEntityForName("ProgressMonitor", inManagedObjectContext: dataStore.managedObjectContext) as! ProgressMonitor
            newProgressMonitor.goal = goal
            newProgressMonitor.giveUpItem = giveItem
            newProgressMonitor.user = dataStore.userContainer[0]
            self.progressMonitor = newProgressMonitor
            
            print(dataStore.userContainer[0].tempGoal?.name)
            print(dataStore.userContainer[0].tempGoal?.giveUpItem?.name)
        
        }
        
        if let goalName = dataStore.userContainer[0].tempGoal?.name, giveUpItem = dataStore.userContainer[0].tempGoal?.giveUpItem?.name, frequency = self.progressMonitor?.initialDaysToGoal {
            
            self.summaryLabel.text = "Great! So it looks like you would need to give up \(giveUpItem) for \(frequency) days in order to get your"
            
            self.goalItemLabel.text = goalName
            
        }
    }
    
    @IBAction func tryTapped(sender: AnyObject) {
        
        self.dataStore.userContainer[0].goalInProgress = dataStore.userContainer[0].tempGoal?.progressMonitor
        
        dataStore.saveContext()
        dataStore.fetchData()
        
//        if dataStore.userContainer[0].goalInProgress != nil {
//        
//        dataStore.managedObjectContext.deleteObject(dataStore.userContainer[0].tempGoal!)
//            
//            dataStore.saveContext()
//            dataStore.fetchData()
//        
//        }
        
//        let beforeGoalAdd = dataStore.userContainer[0].goalsInProgress.count
        
//        if let goalName = self.progressMonitor?.goal.name {
//        
//        dataStore.user.goalsInProgress[goalName] = self.progressMonitor
//        
//        }
        
//        if dataStore.user.goalsInProgress.count > beforeGoalAdd {
//            
//            dataStore.user.tempGoal = nil
//            
//        } else {
//            
//            print("Progress Monitor Didn't Save")
//        }
        
//    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        let destVC = segue.destinationViewController as! GoalStatusViewController
//        
//        if let goal = dataStore.userContainer[0].goalInProgress?.goal {
//        
//        destVC.passedGoal = goal
//            
//        }
    }

    
}
