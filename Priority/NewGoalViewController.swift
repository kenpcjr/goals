//
//  NewGoalViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 7/30/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit
import CoreData

class NewGoalViewController: UIViewController {
    
    let dataStore = DataStore.sharedManager
    
    @IBOutlet weak var GoalNameTextField: UITextField!
    
    @IBOutlet weak var exploreButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backNav = UIBarButtonItem()
        backNav.title = ""
        navigationItem.backBarButtonItem = backNav
        
        self.exploreButton.enabled = false
        
        self.hideKeyboardWhenTappedAround()
        
        
    }
    
    @IBAction func ExploreTapped(sender: AnyObject) {
        
        var goalNameProper = self.GoalNameTextField.text!.lowercaseString
        
        goalNameProper.editTextForStorage()
        
        setUpTempGoal(goalNameProper)
        
    }
    
    @IBAction func goalNameEditing(sender: AnyObject) {
        
        if LanguageHandling.validateItemName(self.GoalNameTextField) {
            
            self.exploreButton.enabled = true
            
        } else {
            
            self.exploreButton.enabled = false
            
        }
        
        
    }
    
    func setUpTempGoal(goalName: String) {
        
        let tempGoal = NSEntityDescription.insertNewObjectForEntityForName("Goal", inManagedObjectContext: dataStore.managedObjectContext) as! Goal
        dataStore.userContainer[0].tempGoal = tempGoal
        dataStore.userContainer[0].tempGoal?.completed = 0
        dataStore.userContainer[0].tempGoal?.startDate = NSDate()
        
        dataStore.userContainer[0].tempGoal?.name = goalName
        
    }
    
}
