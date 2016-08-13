//
//  GoalStatusViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 7/30/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit

class GoalStatusViewController: UIViewController {
    
    let dataStore = DataStore.sharedManager
    
    
    @IBOutlet weak var savingsTotalLabel: UILabel!
    @IBOutlet weak var ItemsToGoalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storesProgressMonitor = dataStore.userContainer[0].goalInProgress
        
        if let savings = storesProgressMonitor?.currentSavingsTotal,
            numberOfItems = storesProgressMonitor?.sacrificesToGoal,
            giveUpName = storesProgressMonitor?.giveUpItem!.name,
            goalName = storesProgressMonitor?.goal!.name {
            
            self.savingsTotalLabel.text = "$\(savings)"
            
            self.ItemsToGoalLabel.text = "You're \(numberOfItems) \(giveUpName)s away from \(goalName)"
            
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        
        dataStore.fetchData()
        
        checkForSucess()
        
        let storesProgressMonitor = dataStore.userContainer[0].goalInProgress
        
        if let savings = storesProgressMonitor?.currentSavingsTotal,
            numberOfItems = storesProgressMonitor?.sacrificesToGoal,
            giveUpName = storesProgressMonitor?.giveUpItem!.name,
            goalName = storesProgressMonitor?.goal!.name {
            
            self.savingsTotalLabel.text = "$\(savings)"
            
            self.ItemsToGoalLabel.text = "You're \(numberOfItems) \(giveUpName)s away from \(goalName)"
        }
        
        
        
        print("Goal: \(dataStore.userContainer[0].goalInProgress?.goal?.cost) \n Savings Total:\(dataStore.userContainer[0].goalInProgress?.currentSavingsTotal)")
        
    }
    
    
    
    
    //    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //
    //        let destVC = segue.destinationViewController as! PurchaseSkipViewController
    //
    //            destVC.passedGoal = self.passedGoal
    //
    //    }
    
    
    func checkForSucess(){
        
        if dataStore.userContainer[0].goalInProgress?.isGoalAcheived == true {
            
            self.performSegueWithIdentifier("goalMet", sender: nil)
        }
        
    }
    
}



