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
        
        self.exploreButton.isEnabled = false
        
        self.hideKeyboardWhenTappedAround()
        
        
    }
    
    @IBAction func ExploreTapped(_ sender: AnyObject) {
        
        var goalNameProper = self.GoalNameTextField.text!.lowercased()
        
        goalNameProper.editTextForStorage()
        
        setUpTempGoal(goalNameProper)
        
    }
    
    @IBAction func goalNameEditing(_ sender: AnyObject) {
        
        if LanguageHandling.validateItemName(self.GoalNameTextField) {
            
            self.exploreButton.isEnabled = true
            
        } else {
            
            self.exploreButton.isEnabled = false
            
        }
        
        
    }
    
    func setUpTempGoal(_ goalName: String) {
        
        let tempGoal = NSEntityDescription.insertNewObject(forEntityName: "Goal", into: dataStore.managedObjectContext) as! Goal
        dataStore.userContainer[0].tempGoal = tempGoal
        dataStore.userContainer[0].tempGoal?.completed = 0
        dataStore.userContainer[0].tempGoal?.startDate = Date()
        
        dataStore.userContainer[0].tempGoal?.name = goalName
        
    }
    
}
