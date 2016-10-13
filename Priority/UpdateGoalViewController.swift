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
        
        guard let goalCost = dataStore.userContainer[0].goalInProgress?.goal?.cost, let giveUpCost = dataStore.userContainer[0].goalInProgress?.giveUpItem?.cost else { return }
        
        print(goalCost)
        print(giveUpCost)
        
        let goalCostWithTwoDecimals = String(format: "%.2f", Double(goalCost))
        let giveUpCostWithTwoDecimals = String(format: "%.2f", Double(giveUpCost))
        
        print(goalCostWithTwoDecimals)
        print(giveUpCostWithTwoDecimals)
        
        self.currentGoalCostTextField.text = "$\(goalCostWithTwoDecimals)"
        
        self.currentGiveUpItemCost.text = "$\(giveUpCostWithTwoDecimals)"
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        presentModificationAlert()
    }
    
    
    @IBAction func updateTapped(_ sender: AnyObject) {
        
        let newGoalCostMinusDollar = self.currentGoalCostTextField.text?.replacingOccurrences(of: "$", with: "")
        
        let newCleanGoalCost = newGoalCostMinusDollar?.replacingOccurrences(of: ",", with: "")
        
        if let newGoalCost = newCleanGoalCost {
            
            dataStore.userContainer[0].goalInProgress?.goal?.cost = Double(newGoalCost) as NSNumber?
            
        }
        
        
        let newItemCostMinusDollar = self.currentGiveUpItemCost.text?.replacingOccurrences(of: "$", with: "")
        
        let newCleanItemCost = newItemCostMinusDollar?.replacingOccurrences(of: ",", with: "")
        
        if let newItemCost = newCleanItemCost {
            
            
            dataStore.userContainer[0].goalInProgress?.giveUpItem?.cost = Double(newItemCost) as NSNumber?
            
        }
        
        dataStore.saveContext()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelTapped(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    func presentModificationAlert() {
        
        let exisitngGoalAlert = UIAlertController.init(title: "Careful!", message: "Any changes you make here will affect all other stats for the current goal", preferredStyle: .alert)
        
        exisitngGoalAlert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: { (Alert) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        exisitngGoalAlert.addAction(UIAlertAction(title: "Change Goal", style: .destructive, handler: nil))
        
        self.present(exisitngGoalAlert, animated: true, completion: nil)
        
    }
    
}
