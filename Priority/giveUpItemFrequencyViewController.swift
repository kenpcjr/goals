//
//  giveUpItemFrequencyViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 7/30/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit

class giveUpItemFrequencyViewController: UIViewController {
    
    let dataStore = DataStore.sharedManager

    @IBOutlet weak var frequencyTextField: UITextField!
    @IBOutlet weak var howOftenLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let text = dataStore.userContainer[0].tempGoal?.giveUpItem?.name {
        
        self.howOftenLabel.text = "How often do you buy \(text)?"
            
        }
    }
    
    @IBAction func continueTapped(sender: AnyObject) {
        
        
        dataStore.userContainer[0].tempGoal?.giveUpItem?.frequency = Int(self.frequencyTextField.text!)!
        
    }
}
