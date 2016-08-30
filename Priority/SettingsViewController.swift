//
//  SettingsViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 8/6/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let settingsLabels = ["Share Goal Status",
                          "Current Goal Details",
                          "Modify Current Goal",
                          "Create New Goal",
                          "User Stats",
                          "View Completed Goals",
                          "About Priority"]
    
    let images = [UIImage.init(named: "text"),
                  UIImage.init(named: "details"),
                  UIImage.init(named: "edit"),
                  UIImage.init(named: "new"),
                  UIImage.init(named: "timeline"),
                  UIImage.init(named: "complete"),
                  UIImage.init(named: "info")]
    
    let dataStore = DataStore.sharedManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let tableViewDelegate = SettingsTableView()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return settingsLabels.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("basicCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = settingsLabels[indexPath.row]
        
        cell.imageView?.image = images[indexPath.row]
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cellTapped = self.settingsLabels[indexPath.row]
        
//        print(cellTapped)
        
        switch cellTapped {
            
        case "Modify Current Goal":
            
            self.performSegueWithIdentifier("adjustGoal", sender: nil)
            
        case "User Stats":
            
            self.performSegueWithIdentifier("userStats", sender: nil)
            
        case "Create New Goal":
            
            self.performSegueWithIdentifier("newGoal", sender: nil)
            
        case "View Completed Goals":
            
            self.performSegueWithIdentifier("pastGoals", sender: nil)
            
        case "Current Goal Details":
            
            self.performSegueWithIdentifier("currentGoalDetails", sender: nil)
            
        case "Share Goal Status":
            
            shareProgress()
            
        case "About Priority":
            
            self.performSegueWithIdentifier("showAbout", sender: nil)
            
        default:
            
//            print("No match")
            
            break
            
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "currentGoalDetails" {
            
            let destinationVC = segue.destinationViewController as! GoalDetailViewController
            
            destinationVC.progressToDisplay = self.dataStore.userContainer[0].goalInProgress
            
        }
        
        
    }
    
    
    @IBAction func doneTapped(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    func shareProgress() {
        
        if let goal = dataStore.userContainer[0].goalInProgress?.goal?.name, sacrifice = dataStore.userContainer[0].goalInProgress?.giveUpItem?.name, savings = dataStore.userContainer[0].goalInProgress?.currentSavingsTotal {
            
            let savingsWithTwoDecimals = String(format: "%.2f", savings)
            
            let shareText = "So far, I've saved $\(savingsWithTwoDecimals) towards my goal with #PriorityApp! I'm working on getting a \(goal) by skipping \(sacrifice)."
            
            let activityVC = UIActivityViewController.init(activityItems: [shareText], applicationActivities: nil)
            
            activityVC.excludedActivityTypes = [UIActivityTypePostToVimeo,
                                                UIActivityTypeAirDrop,
                                                UIActivityTypePrint,
                                                UIActivityTypeOpenInIBooks,
                                                UIActivityTypePostToFlickr,
                                                UIActivityTypeAddToReadingList,
                                                UIActivityTypeSaveToCameraRoll]
            
            self.presentViewController(activityVC, animated: true, completion: nil)
            
        }
        
    }
    
}
