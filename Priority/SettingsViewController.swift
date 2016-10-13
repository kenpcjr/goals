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
                          "Notifications",
                          "About Priority"]
    
    let images = [UIImage.init(named: "text"),
                  UIImage.init(named: "details"),
                  UIImage.init(named: "edit"),
                  UIImage.init(named: "new"),
                  UIImage.init(named: "timeline"),
                  UIImage.init(named: "complete"),
                  UIImage.init(named: "notification"),
                  UIImage.init(named: "info")]
    
    let dataStore = DataStore.sharedManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let tableViewDelegate = SettingsTableView()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return settingsLabels.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        
        cell.textLabel?.text = settingsLabels[(indexPath as NSIndexPath).row]
        
        cell.imageView?.image = images[(indexPath as NSIndexPath).row]
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cellTapped = self.settingsLabels[(indexPath as NSIndexPath).row]
        
        print(cellTapped)
        
        switch cellTapped {
            
        case "Modify Current Goal":
            
            self.performSegue(withIdentifier: "adjustGoal", sender: nil)
            
        case "User Stats":
            
            self.performSegue(withIdentifier: "userStats", sender: nil)
            
        case "Create New Goal":
            
            self.performSegue(withIdentifier: "newGoal", sender: nil)
            
        case "View Completed Goals":
            
            self.performSegue(withIdentifier: "pastGoals", sender: nil)
            
        case "Current Goal Details":
            
            self.performSegue(withIdentifier: "currentGoalDetails", sender: nil)
            
        case "Share Goal Status":
            
            shareProgress()
            
        case "About Priority":
            
            self.performSegue(withIdentifier: "showAbout", sender: nil)
            
        default:
            
            print("No match")
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "currentGoalDetails" {
            
            let destinationVC = segue.destination as! GoalDetailViewController
            
            destinationVC.progressToDisplay = self.dataStore.userContainer[0].goalInProgress
            
        }
        
        
    }
    
    
    @IBAction func doneTapped(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    func shareProgress() {
        
        if let goal = dataStore.userContainer[0].goalInProgress?.goal?.name, let sacrifice = dataStore.userContainer[0].goalInProgress?.giveUpItem?.name, let savings = dataStore.userContainer[0].goalInProgress?.currentSavingsTotal {
            
            let savingsWithTwoDecimals = String(format: "%.2f", savings)
            
            let shareText = "So far, I've saved $\(savingsWithTwoDecimals) towards my goal with #PriorityApp! I'm working on getting a \(goal) by skipping \(sacrifice)."
            
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
    
}
