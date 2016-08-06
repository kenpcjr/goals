//
//  InitialPageViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 8/6/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit

class InitialPageViewController: UIPageViewController {
    
    let dataStore = DataStore.sharedManager
 
    
    override func viewWillAppear(animated: Bool) {
        
        if dataStore.userContainer[0].goalInProgress != nil {
            
            print("appDelegate sees a goal")
            
            let goalStatus = self.storyboard!.instantiateViewControllerWithIdentifier("GoalStatus")

            self.setViewControllers([goalStatus], direction: .Forward, animated: false, completion: nil)
            
        } else {
            
            print("Pageview sees no goal")
            
            let welcome = self.storyboard!.instantiateViewControllerWithIdentifier("Welcome")
            
            self.setViewControllers([welcome], direction: .Forward, animated: false, completion: nil)
        }
    }
    
}
