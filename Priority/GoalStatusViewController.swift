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
        

    }
    
    override func viewWillAppear(animated: Bool) {
        
//        print("fetched")
        
        dataStore.fetchData()
        
        checkForSucess()
        
        let storesProgressMonitor = dataStore.userContainer[0].goalInProgress
        
        if let savings = storesProgressMonitor?.currentSavingsTotal,
            numberOfItems = storesProgressMonitor?.sacrificesToGoal,
            giveUpName = storesProgressMonitor?.giveUpItem!.name,
            goalName = storesProgressMonitor?.goal!.name {
            
            var giveUpNameCopy = giveUpName
            
            giveUpNameCopy.removePluralSuffix()
            
            let savingsWithTwoDecimals = String(format: "%.2f", savings)
            
            self.savingsTotalLabel.text = "$\(savingsWithTwoDecimals)"
            
            self.ItemsToGoalLabel.text = "You're \(numberOfItems) \(giveUpNameCopy)s away from your \(goalName)"
            
            
            let backNav = UIBarButtonItem()
            backNav.title = ""
            navigationItem.backBarButtonItem = backNav
            
        }
        
//        print("Goal: \(dataStore.userContainer[0].goalInProgress?.goal?.cost) \n Savings Total:\(dataStore.userContainer[0].goalInProgress?.currentSavingsTotal)")
        
    }
    
    
    
    func checkForSucess(){
        
        if dataStore.userContainer[0].goalInProgress?.isGoalAcheived == true {
            
            self.performSegueWithIdentifier("goalMet", sender: nil)
        }
        
    }
    
}



