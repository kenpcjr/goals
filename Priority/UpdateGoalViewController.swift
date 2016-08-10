//
//  UpdateGoalViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 8/9/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit

class UpdateGoalViewController: UIViewController {
    
    let dataStore = DataStore.sharedManager

    @IBOutlet weak var currentGoalCostTextField: UITextField!
    @IBOutlet weak var currentGiveUpItemCost: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let goalCost = dataStore.userContainer[0].goalInProgress?.goal?.cost, giveUpCost = dataStore.userContainer[0].goalInProgress?.giveUpItem?.cost else { return }
        
        self.currentGoalCostTextField.text = String(goalCost)
        
        self.currentGiveUpItemCost.text = String(giveUpCost)
        
    }

    
    @IBAction func updateTapped(sender: AnyObject) {
        
        dataStore.userContainer[0].goalInProgress?.goal?.cost = Double(self.currentGoalCostTextField.text!)
        
        dataStore.userContainer[0].goalInProgress?.giveUpItem?.cost = Double(self.currentGiveUpItemCost.text!)
        
        dataStore.saveContext()
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
