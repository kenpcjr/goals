//
//  MainNavigationController.swift
//  Priority
//
//  Created by Kenneth Cooke on 8/7/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

//import UIKit
//
//
//class MainNavigationController: UINavigationController {
//    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(true)
//        
//        let dataStore = DataStore.sharedManager
//        
//        
//        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//        
//        if dataStore.userContainer[0].goalInProgress != nil {
//            
//            print("NavController sees a goal")
//            
//            let goalStatus = storyboard.instantiateViewControllerWithIdentifier("GoalStatus")
//
//            self.presentViewController(goalStatus, animated: true, completion: nil)
//            
//        }
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//}
