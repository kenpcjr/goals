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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.giveUpCostTextField.becomeFirstResponder()
        
    }
    
    
    
    @IBAction func continueTapped(sender: AnyObject) {
        
        let costMinusDollar = self.giveUpCostTextField.text?.stringByReplacingOccurrencesOfString("$", withString: "")
        let cleanCost = costMinusDollar?.stringByReplacingOccurrencesOfString(",", withString: "")
    
    dataStore.userContainer[0].tempGoal?.giveUpItem?.cost = Double(cleanCost!)

    }
}
