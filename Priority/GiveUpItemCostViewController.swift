//
//  GiveUpItemCostViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 8/7/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit

class GiveUpItemCostViewController: UIViewController {
    
    let dataStore = DataStore.sharedManager
    
    @IBOutlet weak var giveUpCostTextField: UITextField!
    
    
    @IBAction func continueTapped(sender: AnyObject) {
    
    dataStore.userContainer[0].tempGoal?.giveUpItem?.cost = Double(self.giveUpCostTextField.text!)!

    }
}
