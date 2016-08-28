//
//  GoalDetailViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 8/17/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit

class GoalDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var detailsTableView: UITableView!
    
    var progressToDisplay: ProgressMonitor?
    var detailCategories: [String] = []
    var detailStats: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detailsTableView.delegate = self
        self.detailsTableView.dataSource = self
        
        addDetailStatsToStatsArrayBasedOnCompletion()
        addCategoriesToCategoriesArrayBasedOnCompletion()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.detailCategories.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("basicCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = self.detailCategories[indexPath.row]
        cell.detailTextLabel?.text = self.detailStats[indexPath.row]
        
        return cell
    }
    
    
    func addDetailStatsToStatsArrayBasedOnCompletion() {
        
        // find a way to substitute (else) nil.
        
        let goalName = self.progressToDisplay?.goal?.name ?? "No Current goal"
        let startDate = self.progressToDisplay?.goal?.startDate ?? NSDate.distantPast()
        let goalCost = self.progressToDisplay?.goal?.cost ?? 0
        let sacrificeName = self.progressToDisplay?.giveUpItem?.name ?? "No Skip Item set"
        let lastSacrifice = self.progressToDisplay?.mostRecentSacrifice ?? NSDate.distantPast()
        let sacrificeFrequency = self.progressToDisplay?.giveUpItem?.frequency ?? 0
        let sacrificeCost = self.progressToDisplay?.giveUpItem?.cost ?? 0
        let sacrificeCount = self.progressToDisplay?.numberOfSacrifices ?? 0
        let sacrificesToGoal = self.progressToDisplay?.sacrificesToGoal ?? 0
        let savingsTotal = self.progressToDisplay?.currentSavingsTotal ?? 0
        let dollarsToGoal = self.progressToDisplay?.dollarsToGoal ?? 0
        let daysToGoal = self.progressToDisplay?.initialDaysToGoal ?? 0
        
        let goalCostWithTwoDecimals = String(format: "%.2f", Double(goalCost))
        let sacrificeCostWithTwoDecimals = String(format: "%.2f", Double(sacrificeCost))
        
        let dateFormat = NSDateFormatter()
        dateFormat.dateStyle = .MediumStyle
        
        let formattedStartDate = dateFormat.stringFromDate(startDate)
        let formattedLastSacrifice = dateFormat.stringFromDate(lastSacrifice)
        let savingsTotalWithTwoDecimals = String(format: "%.2f", Double(savingsTotal))
        let dollarsToGoalWithTwoDecimals = String(format: "%.2f", Double(dollarsToGoal))
        
        
        if self.progressToDisplay?.isGoalAcheived == false {
            
            self.detailStats = ["\(goalName)",
                                "\(formattedStartDate)",
                                "$\(goalCostWithTwoDecimals)",
                                "\(sacrificeName)",
                                "\(formattedLastSacrifice)",
                                "\(sacrificeFrequency)",
                                "$\(sacrificeCostWithTwoDecimals)",
                                "\(sacrificeCount)",
                                "\(sacrificesToGoal)",
                                "$\(savingsTotalWithTwoDecimals)",
                                "$\(dollarsToGoalWithTwoDecimals)",
                                "\(Int(daysToGoal))"]
            
        } else {
            
            self.detailStats = ["\(goalName)",
                                "\(formattedStartDate)",
                                "$\(goalCostWithTwoDecimals)",
                                "\(sacrificeName)",
                                "\(sacrificeFrequency)",
                                "$\(sacrificeCostWithTwoDecimals)",
                                "\(sacrificeCount)",
                                "$\(savingsTotalWithTwoDecimals)",
                                "\(formattedLastSacrifice)"]
            
            
        }
        
    
    }
    
    func addCategoriesToCategoriesArrayBasedOnCompletion() {
        
        if self.progressToDisplay?.isGoalAcheived == false {
            
            self.detailCategories = ["Goal Name:", "Goal Started:",
                                     "Goal Cost:", "Skip Item:",
                                     "Last Skip", "Skip Frequency:",
                                     "Skip Cost:", "Total Skips:",
                                     "Skips to Goal:", "Total Savings:",
                                     "Dollars to Goal:", "Days to Goal:"]
            
        } else {
            
            self.detailCategories = ["Goal Name:", "Goal Started:",
                                     "Goal Cost:", "Skip Item:",
                                     "Skip Frequency:", "Skip Cost:",
                                     "Total Skips:", "Total Savings:",
                                     "Date Completed:"]
            
        }
        
    }
    
    
    @IBAction func doneTapped(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    
}
