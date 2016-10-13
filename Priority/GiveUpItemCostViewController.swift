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
        
        self.continueButton.isEnabled = false
        self.hideKeyboardWhenTappedAround()
        
        
        let backNav = UIBarButtonItem()
        backNav.title = ""
        navigationItem.backBarButtonItem = backNav
        
        
    }
    
    @IBAction func costEditing(_ sender: AnyObject) {
       
        if LanguageHandling.checkForValidPrice(self.giveUpCostTextField) {
            
            self.continueButton.isEnabled = true
            
        } else {
            
            self.continueButton.isEnabled = false
            
        }
        
    }
    
    
    @IBAction func continueTapped(_ sender: AnyObject) {
        
        let costMinusDollar = self.giveUpCostTextField.text?.replacingOccurrences(of: "$", with: "")
        let cleanCost = costMinusDollar?.replacingOccurrences(of: ",", with: "")
    
    dataStore.userContainer[0].tempGoal?.giveUpItem?.cost = Double(cleanCost!) as NSNumber?

    }
}
