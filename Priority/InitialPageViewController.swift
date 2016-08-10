////
////  InitialPageViewController.swift
////  Priority
////
////  Created by Kenneth Cooke on 8/6/16.
////  Copyright © 2016 kencooke. All rights reserved.
////
//
//import UIKit
//
//class InitialPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
//    
//    let dataStore = DataStore.sharedManager
//    var views: [UIViewController] = []
//    var settings = UIViewController()
//    var goalStatus = UIViewController()
//    var pageTracker = 0
//    var lastViewController: UIViewController?
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//        self.delegate = self
//        self.dataSource = self
//        
//        self.goalStatus = self.storyboard!.instantiateViewControllerWithIdentifier("GoalStatus")
//        self.settings = self.storyboard!.instantiateViewControllerWithIdentifier("settings")
//        
//        views.append(goalStatus)
//        views.append(settings)
//        
//    }
//    
//    
//    override func viewWillAppear(animated: Bool) {
//        
//        if dataStore.userContainer[0].goalInProgress != nil {
//            
//            print("Pageview sees a goal")
//            
//            let goalStatus = self.storyboard!.instantiateViewControllerWithIdentifier("GoalStatus")
//            
//            self.setViewControllers([goalStatus], direction: .Forward, animated: false, completion: nil)
//            
//        } else {
//            
//            print("Pageview sees no goal")
//            
//            let welcome = self.storyboard!.instantiateViewControllerWithIdentifier("Welcome")
//            
//            self.setViewControllers([welcome], direction: .Forward, animated: false, completion: nil)
//        }
//        
//        
//        //        let swipeFromLeft = UISwipeGestureRecognizer(target: self, action: #selector(moveToSettings))
//        //
//        //        self.view.addGestureRecognizer(swipeFromLeft)
//        
//        
//    }
//    
//    
//    
//    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
////      
////        if self.childViewControllers[0].restorationIdentifier != "goalStatus" {
////            
////            return self.settings
////            
////        } else {
////            
////            return nil
////        }
//        
////        let current = views.indexOf(self.childViewControllers[0])
////        
////        if current == 0 {
////            
////            return nil
////            
////        } else {
////            
////            return views[Int(current!) - 1]
////        }
//        
////        
////        if self.pageTracker == 0 {
////            
////            return self.settings
////            
////        } else {
////            
////            return nil
////            
////        }
//        
//        if self.lastViewController == self.goalStatus {
//            
//            return nil
//            
//        } else if self.lastViewController == self.settings || self.lastViewController == nil {
//            
//            return self.settings
//        }
//        
//        return nil
//    }
//    
//    
//    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
//        
////        if self.childViewControllers[0].restorationIdentifier != "settings" {
////            
////            return goalStatus
////            
////        } else {
////            
////            return nil
////        }
////
//        
////        let current = views.indexOf(self.childViewControllers[0])
////        
////        if current < views.count - 1{
////            
////            return views[Int(current!) + 1]
////            
////        } else {
////            
////            return nil
////        }
//
////        
////        if self.pageTracker == 1 {
////            
////            return self.goalStatus
////            
////        } else {
////            
////            return nil
////        }
//        
//        if self.lastViewController == self.goalStatus {
//            
//            return self.goalStatus
//            
//        } else if self.lastViewController == self.settings {
//            
//            return nil
//            
//        }
//        
//        return nil
//        
//    }
//    
//    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//        
////        if self.pageTracker == 0 && completed == true && finished == true {
////            
////            self.pageTracker = 1
////            
////        } else if self.pageTracker == 1 && completed == true && finished == true {
////            
////            self.pageTracker = 0
////        }
//        
//        if let last = previousViewControllers.last {
//        
//        self.lastViewController = last
//            
//        }
//        
//        print(previousViewControllers.last)
//        print(pageTracker)
//    }
//    
//    
//    //
//    //    func moveToSettings() {
//    //
//    //
//    //        if self.childViewControllers[0].restorationIdentifier != "settings" {
//    //
//    //            let settings = self.storyboard!.instantiateViewControllerWithIdentifier("settings")
//    //
//    //            self.setViewControllers([settings], direction: .Reverse, animated: true, completion: nil)
//    //            
//    //        }
//    
//    //    }
//    
//}
