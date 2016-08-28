//
//  GiveUpItemCostViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 8/7/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit
import CurrencyTextField

class GiveUpItemCostViewController: UIViewController {
    
    let dataStore = DataStore.sharedManager
    
    @IBOutlet weak var giveUpCostTextField: CurrencyTextField!
    @IBOutlet weak var continueButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.continueButton.enabled = false
        self.hideKeyboardWhenTappedAround()
        
    }
    
    @IBAction func costEditing(sender: AnyObject) {
       
        if LanguageHandling.checkForValidPrice(self.giveUpCostTextField) {
            
            self.continueButton.enabled = true
            
        } else {
            
            self.continueButton.enabled = false
            
        }
        
    }
    
    
    @IBAction func continueTapped(sender: AnyObject) {
        
        let costMinusDollar = self.giveUpCostTextField.text?.stringByReplacingOccurrencesOfString("$", withString: "")
        let cleanCost = costMinusDollar?.stringByReplacingOccurrencesOfString(",", withString: "")
    
    dataStore.userContainer[0].tempGoal?.giveUpItem?.cost = Double(cleanCost!)

    }
}
