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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.detailCategories.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        
        cell.textLabel?.text = self.detailCategories[(indexPath as NSIndexPath).row]
        cell.detailTextLabel?.text = self.detailStats[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    
    func addDetailStatsToStatsArrayBasedOnCompletion() {
        
        // find a way to substitute (else) nil.
        
        let goalName = self.progressToDisplay?.goal?.name ?? "No Current goal"
        let startDate = self.progressToDisplay?.goal?.startDate ?? Date.distantPast
        let goalCost = self.progressToDisplay?.goal?.cost ?? 0
        let sacrificeName = self.progressToDisplay?.giveUpItem?.name ?? "No Skip Item set"
        let lastSacrifice = self.progressToDisplay?.mostRecentSacrifice ?? Date.distantPast
        let sacrificeFrequency = self.progressToDisplay?.giveUpItem?.frequency ?? 0
        let sacrificeCost = self.progressToDisplay?.giveUpItem?.cost ?? 0
        let sacrificeCount = self.progressToDisplay?.numberOfSacrifices ?? 0
        let sacrificesToGoal = self.progressToDisplay?.sacrificesToGoal ?? 0
        let savingsTotal = self.progressToDisplay?.currentSavingsTotal ?? 0
        let dollarsToGoal = self.progressToDisplay?.dollarsToGoal ?? 0
        let daysToGoal = self.progressToDisplay?.initialDaysToGoal ?? 0
        
        let goalCostWithTwoDecimals = String(format: "%.2f", Double(goalCost))
        let sacrificeCostWithTwoDecimals = String(format: "%.2f", Double(sacrificeCost))
        
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .medium
        
        let formattedStartDate = dateFormat.string(from: startDate)
        let formattedLastSacrifice = dateFormat.string(from: lastSacrifice)
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
    
    
    @IBAction func doneTapped(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
}
