//
//  goalMetViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 8/10/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit

class goalMetViewController: UIViewController {
    
    let dataStore = DataStore.sharedManager
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//Array(arrayLiteral: dataStore.userContainer[0].goalsComplete).append(dataStore.userContainer[0].goalInProgress)
        //dataStore.userContainer[0].goalInProgress
        
        
    }
    
    
    
    

    @IBAction func dismissTapped(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    
}
