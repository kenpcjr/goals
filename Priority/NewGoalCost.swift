//
//  NewGoalCost.swift
//  Priority
//
//  Created by Kenneth Cooke on 8/7/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit
import CoreData
import CurrencyTextField

class NewGoalCost: UIViewController {
    
    @IBOutlet weak var goalCostTextField: CurrencyTextField!
    @IBOutlet weak var continueButton: UIButton!
    
    
    let dataStore = DataStore.sharedManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.continueButton.enabled = false
        self.hideKeyboardWhenTappedAround()
    
    }
    
    @IBAction func priceEditing(sender: AnyObject) {
        
        if LanguageHandling.checkForValidPrice(self.goalCostTextField) {
            
            self.continueButton.enabled = true
            
        } else {
            
            self.continueButton.enabled = false
            
        }
        
    }

    @IBAction func continueTapped(sender: AnyObject) {
        
        let costMinusDollar = self.goalCostTextField.text?.stringByReplacingOccurrencesOfString("$", withString: "")
        let cleanCost = costMinusDollar?.stringByReplacingOccurrencesOfString(",", withString: "")
        
        dataStore.userContainer[0].tempGoal?.cost = Double(cleanCost!)
        
        
    }
    
    
}
