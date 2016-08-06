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
    @IBOutlet weak var goalCostTextField: UITextField!
    @IBOutlet weak var exploreButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.exploreButton.enabled = false
        
    }

    @IBAction func ExploreTapped(sender: AnyObject) {
        
//        let newGoal = Goal()
//        newGoal.name = self.GoalNameTextField.text!
//        newGoal.cost = Double(self.goalCostTextField.text!)!
//        
//        dataStore.userContainer[0].tempGoal = newGoal
//        
        
        
        
//        dataStore.userContainer[0].tempGoal = Goal.
        
        let tempGoal = NSEntityDescription.insertNewObjectForEntityForName("Goal", inManagedObjectContext: dataStore.managedObjectContext) as! Goal
        dataStore.userContainer[0].tempGoal = tempGoal
        dataStore.userContainer[0].tempGoal?.completed = 0
        dataStore.userContainer[0].tempGoal?.startDate = NSDate()
        
        dataStore.userContainer[0].tempGoal?.name = self.GoalNameTextField.text!
        dataStore.userContainer[0].tempGoal?.cost = Double(self.goalCostTextField.text!)
        
        print(dataStore.userContainer[0].tempGoal?.name)
        print(dataStore.userContainer[0].tempGoal?.cost)
        
    }
    
    @IBAction func priceEditing(sender: AnyObject) {
        
        if validatePrice(self.goalCostTextField) {
            
            self.exploreButton.enabled = true
            
        } else {
            
            self.exploreButton.enabled = false
            
        }
        
    }
    
    func validateItemName(textField: UITextField) -> Bool {
        
        let hasContent = textField.text?.characters.count > 0
        let isThreeWordsOrLess = textField.text?.componentsSeparatedByString(" ").count <= 3
        
        if hasContent && isThreeWordsOrLess {
            
            return true
            
        }
        
        return false
        
    }
    
    func validatePrice(textField: UITextField) -> Bool {
        
        let hasContent = textField.text?.characters.count > 0
        let numbersSet = NSCharacterSet.init(charactersInString: "0123456789")
        let isNumbersOnly = textField.text?.rangeOfCharacterFromSet(numbersSet.invertedSet) == nil
        
        if hasContent && isNumbersOnly {
            
            print("True")
            return true
            
        }
        
        print(false)
        return false
        
    }
}