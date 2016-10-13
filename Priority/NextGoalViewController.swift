//
//  NextGoalViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 8/28/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit

class NextGoalViewController: UIViewController {
    
    let dataStore = DataStore.sharedManager

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataStore.fetchData()
        
        let backNav = UIBarButtonItem()
        backNav.title = ""
        navigationItem.backBarButtonItem = backNav
        
        if dataStore.userContainer[0].goalInProgress != nil {
        
        let exisitngGoalAlert = UIAlertController.init(title: "Careful!", message: "It looks like you already have a goal in progress. If you create a new goal, all data for your current goal will be lost. Are you sure you want to replace your goal?", preferredStyle: .alert)
            
            exisitngGoalAlert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: { (Alert) in
                self.dismiss(animated: true, completion: nil)
            }))
                
            exisitngGoalAlert.addAction(UIAlertAction(title: "Replace Goal", style: .destructive, handler: nil))
            self.present(exisitngGoalAlert, animated: true, completion: nil)
           
        
            
        }

    }

}
