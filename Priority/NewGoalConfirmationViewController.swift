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
        
//        print(dataStore.userContainer[0].tempGoal?.name)
//        print(dataStore.userContainer[0].tempGoal?.giveUpItem?.name)
        
        if let goal = dataStore.userContainer[0].tempGoal, giveItem = dataStore.userContainer[0].tempGoal!.giveUpItem {
            
            let newProgressMonitor = NSEntityDescription.insertNewObjectForEntityForName("ProgressMonitor", inManagedObjectContext: dataStore.managedObjectContext) as! ProgressMonitor
            newProgressMonitor.goal = goal
            newProgressMonitor.giveUpItem = giveItem
            newProgressMonitor.user = dataStore.userContainer[0]
            self.progressMonitor = newProgressMonitor
            
//            print(dataStore.userContainer[0].tempGoal?.name)
//            print(dataStore.userContainer[0].tempGoal?.giveUpItem?.name)
            
            
            let backNav = UIBarButtonItem()
            backNav.title = ""
            navigationItem.backBarButtonItem = backNav
            
            
        }
        
        if let goalName = dataStore.userContainer[0].tempGoal?.name, giveUpItem = dataStore.userContainer[0].tempGoal?.giveUpItem?.name, daysToGoal = self.progressMonitor?.initialDaysToGoal {
            
            if daysToGoal >= 364 {
                
                let frequencyInWeeks = Int(ceil(daysToGoal / 7.0))
                
                
                self.summaryLabel.text = "So it looks like you would need to give up \(giveUpItem) for \(frequencyInWeeks) weeks in order to get your"
                
            } else {
                
                self.summaryLabel.text = "So it looks like you would need to give up \(giveUpItem) for \(Int(daysToGoal)) days in order to get your"
                
            }
            
            self.goalItemLabel.text = goalName
            
        }
    }
    
    @IBAction func tryTapped(sender: AnyObject) {
        
        self.dataStore.userContainer[0].goalInProgress = dataStore.userContainer[0].tempGoal?.progressMonitor
        
        dataStore.saveContext()
        dataStore.fetchData()
        
 
    }
    
    
}
