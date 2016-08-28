//
//  UpdateGoalViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 8/9/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit
import CurrencyTextField

class UpdateGoalViewController: UIViewController {
    
    let dataStore = DataStore.sharedManager

    @IBOutlet weak var currentGoalCostTextField: CurrencyTextField!
    @IBOutlet weak var currentGiveUpItemCost: CurrencyTextField!
    @IBOutlet weak var updateButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        guard let goalCost = dataStore.userContainer[0].goalInProgress?.goal?.cost, giveUpCost = dataStore.userContainer[0].goalInProgress?.giveUpItem?.cost else { return }
        
        self.currentGoalCostTextField.text = String(goalCost)
        
        self.currentGiveUpItemCost.text = String(giveUpCost)
        
    }

    
    @IBAction func updateTapped(sender: AnyObject) {
        
        let newGoalCostMinusDollar = self.currentGoalCostTextField.text?.stringByReplacingOccurrencesOfString("$", withString: "")
        
        let newCleanGoalCost = newGoalCostMinusDollar?.stringByReplacingOccurrencesOfString(",", withString: "")
        
        if let newGoalCost = newCleanGoalCost {
        
        dataStore.userContainer[0].goalInProgress?.goal?.cost = Double(newGoalCost)
            
        }
        
        
        let newItemCostMinusDollar = self.currentGiveUpItemCost.text?.stringByReplacingOccurrencesOfString("$", withString: "")
        
        let newCleanItemCost = newItemCostMinusDollar?.stringByReplacingOccurrencesOfString(",", withString: "")
        
        if let newItemCost = newCleanItemCost {

        
        dataStore.userContainer[0].goalInProgress?.giveUpItem?.cost = Double(newItemCost)
            
        }
        
        dataStore.saveContext()
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelTapped(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
}
