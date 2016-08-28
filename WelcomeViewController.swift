//
//  WelcomeViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 7/30/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    let dataStore = DataStore.sharedManager
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        dataStore.fetchData()
        
        if dataStore.userContainer[0].goalInProgress != nil {
            
            print(dataStore.userContainer[0].goalInProgress?.goal!.name)
            print(dataStore.userContainer[0].goalInProgress?.giveUpItem!.name)
            
        } else {
            
            print("There is no goal set")
        }
        
        
        let backNav = UIBarButtonItem()
        backNav.title = ""
        navigationItem.backBarButtonItem = backNav
        
        
    }
    

    
}
