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

class NewGoalCost: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var goalCostTextField: CurrencyTextField!
    
    
    let dataStore = DataStore.sharedManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.goalCostTextField.delegate = self
    
    }
    

    @IBAction func continueTapped(sender: AnyObject) {
        
        let costMinusDollar = self.goalCostTextField.text?.stringByReplacingOccurrencesOfString("$", withString: "")
        let cleanCost = costMinusDollar?.stringByReplacingOccurrencesOfString(",", withString: "")
        
        dataStore.userContainer[0].tempGoal?.cost = Double(cleanCost!)
        
        
    }
    
    
}
