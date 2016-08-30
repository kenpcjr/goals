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
        
        let goalCostWithTwoDecimals = String(format: "%.2f", Double(goalCost))
        let giveUpCostWithTwoDecimals = String(format: "%.2f", Double(giveUpCost))
        
        self.currentGoalCostTextField.text = "$\(goalCostWithTwoDecimals)"
        
        self.currentGiveUpItemCost.text = "$\(giveUpCostWithTwoDecimals)"
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        presentModificationAlert()
    }
    
    
    @IBAction func updateTapped(sender: AnyObject) {
        
        formatAndAssignUpdates()
        
        dataStore.saveContext()
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelTapped(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    func presentModificationAlert() {
        
        let exisitngGoalAlert = UIAlertController.init(title: "Careful!", message: "Any changes you make here will affect all other stats for the current goal", preferredStyle: .Alert)
        
        exisitngGoalAlert.addAction(UIAlertAction.init(title: "Cancel", style: .Cancel, handler: { (Alert) in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        exisitngGoalAlert.addAction(UIAlertAction(title: "Change Goal", style: .Destructive, handler: nil))
        
        self.presentViewController(exisitngGoalAlert, animated: true, completion: nil)
        
    }
    
    func formatAndAssignUpdates() {
        
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
        
        
    }
    
}
