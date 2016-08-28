//
//  NewGoalViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 7/30/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit
import CoreData

class NewGoalViewController: UIViewController, UITextFieldDelegate {
    
    let dataStore = DataStore.sharedManager
    
    @IBOutlet weak var GoalNameTextField: UITextField!
    
    @IBOutlet weak var exploreButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.exploreButton.enabled = false
        
        self.GoalNameTextField.delegate = self
        
        
    }
    
    @IBAction func ExploreTapped(sender: AnyObject) {
        
        
        // working on upper and lowercase
        
        var goalNameProper = self.GoalNameTextField.text!.lowercaseString
        
        print(goalNameProper)
        
        if goalNameProper.hasPrefix("a ") == true {
            
            goalNameProper = goalNameProper.stringByReplacingOccurrencesOfString("a ", withString: "")
            
        }
        
        if goalNameProper.hasSuffix(" ") == true {
            
            while goalNameProper.hasSuffix(" ") {
                
                goalNameProper.removeAtIndex(goalNameProper.endIndex.predecessor())
                
            }
            
        }
        
        if goalNameProper.hasPrefix("my ") {
            
            goalNameProper = goalNameProper.stringByReplacingOccurrencesOfString("my ", withString: "")
            
        }
        
        
        goalNameProper = goalNameProper.capitalizedString
        
        
        let tempGoal = NSEntityDescription.insertNewObjectForEntityForName("Goal", inManagedObjectContext: dataStore.managedObjectContext) as! Goal
        dataStore.userContainer[0].tempGoal = tempGoal
        dataStore.userContainer[0].tempGoal?.completed = 0
        dataStore.userContainer[0].tempGoal?.startDate = NSDate()
        
        dataStore.userContainer[0].tempGoal?.name = goalNameProper
        
        print(dataStore.userContainer[0].tempGoal?.name)
        print(dataStore.userContainer[0].tempGoal?.cost)
        
    }
    
    //    @IBAction func priceEditing(sender: AnyObject) {
    //
    //        if validatePrice(self.goalCostTextField) {
    //
    //            self.exploreButton.enabled = true
    //
    //        } else {
    //
    //            self.exploreButton.enabled = false
    //
    //        }
    //
    //    }
    
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
