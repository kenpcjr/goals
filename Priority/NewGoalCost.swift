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
        
        self.continueButton.isEnabled = false
        self.hideKeyboardWhenTappedAround()
        
        
        let backNav = UIBarButtonItem()
        backNav.title = ""
        navigationItem.backBarButtonItem = backNav
        
    
    }
    
    @IBAction func priceEditing(_ sender: AnyObject) {
        
        if LanguageHandling.checkForValidPrice(self.goalCostTextField) {
            
            self.continueButton.isEnabled = true
            
        } else {
            
            self.continueButton.isEnabled = false
            
        }
        
    }

    @IBAction func continueTapped(_ sender: AnyObject) {
        
        let costMinusDollar = self.goalCostTextField.text?.replacingOccurrences(of: "$", with: "")
        let cleanCost = costMinusDollar?.replacingOccurrences(of: ",", with: "")
        
        dataStore.userContainer[0].tempGoal?.cost = Double(cleanCost!) as NSNumber?
        
        
    }
    
    
}
