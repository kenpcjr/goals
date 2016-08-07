//
//  NewGoalCost.swift
//  Priority
//
//  Created by Kenneth Cooke on 8/7/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit
import CoreData

class NewGoalCost: UIViewController, UITextFieldDelegate {
    
     @IBOutlet weak var goalCostTextField: UITextField!
    
    let dataStore = DataStore.sharedManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.goalCostTextField.delegate = self
        
        self.goalCostTextField.becomeFirstResponder()
    
    }
    

    @IBAction func continueTapped(sender: AnyObject) {
        
        dataStore.userContainer[0].tempGoal?.cost = Double(self.goalCostTextField.text!)
        
    }
    
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        
//
//        
//        let giveUpVC = self.storyboard?.instantiateViewControllerWithIdentifier("GiveUpItemName")
//        
//         self.presentViewController(giveUpVC!, animated: true, completion: nil)
//        
//        return false
//    
//    
//    }
    
    
}
