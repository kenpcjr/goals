//
//  goalMetViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 8/10/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit
import SAConfettiView

class goalMetViewController: UIViewController {
    
    let dataStore = DataStore.sharedManager
    
    var goalNameForShare: String?
    var skipNameForShare: String?
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let confettiView = SAConfettiView(frame: self.view.bounds)
        self.view.addSubview(confettiView)
        self.view.sendSubview(toBack: confettiView)
        self.view.sendSubview(toBack: self.backgroundImage)
        
        
        confettiView.colors = [UIColor.black, UIColor.gray, UIColor.darkGray]
        
        
        confettiView.startConfetti()
        
        self.dataStore.userContainer[0].goalInProgress?.goal?.endDate = Date.init()
        
        self.goalNameForShare = dataStore.userContainer[0].goalInProgress?.goal?.name
        
        self.skipNameForShare = dataStore.userContainer[0].goalInProgress?.giveUpItem?.name
        
        saveCurrentGoalToCompleted()
        
    }
    
    
    @IBAction func shareTapped(_ sender: AnyObject) {
        
        if let goal = self.goalNameForShare, let sacrifice = self.skipNameForShare {
            
            
            let shareText = "I just hit my goal with #PriorityApp! I'm getting a \(goal) by skipping \(sacrifice)."
            
            let activityVC = UIActivityViewController.init(activityItems: [shareText], applicationActivities: nil)
            
            activityVC.excludedActivityTypes = [UIActivityType.postToVimeo,
                                                UIActivityType.airDrop,
                                                UIActivityType.print,
                                                UIActivityType.openInIBooks,
                                                UIActivityType.postToFlickr,
                                                UIActivityType.addToReadingList,
                                                UIActivityType.saveToCameraRoll]
            
            self.present(activityVC, animated: true, completion: nil)
            
        }
        
    }
    
    func saveCurrentGoalToCompleted() {
        
        let initialCompletedCount = dataStore.userContainer[0].goalsComplete?.count
        
        print(initialCompletedCount)
        
        let currentProgressMonitor = dataStore.userContainer[0].goalInProgress
        
        let completedGoalMutableCopy = dataStore.userContainer[0].goalsComplete?.mutableCopy() as! NSMutableOrderedSet
        
        if let currentProgressMonitor = currentProgressMonitor {
            
            completedGoalMutableCopy.add(currentProgressMonitor)
            
            dataStore.userContainer[0].goalsComplete = completedGoalMutableCopy as NSOrderedSet
            
            
        }
        
        let currentCompletedCount = dataStore.userContainer[0].goalsComplete?.count
        
        if let initialCompletedCount = initialCompletedCount, let currentCompletedCount = currentCompletedCount {
            
            if initialCompletedCount < currentCompletedCount {
                
                dataStore.userContainer[0].goalInProgress = nil
                
                dataStore.saveContext()
                dataStore.fetchData()
                
            }
            
        }
    }
}
