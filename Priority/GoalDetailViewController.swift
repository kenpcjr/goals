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
        
        // Do any additional setup after loading the view.
        
        addDetailStatsToStatsArrayBasedOnCompletion()
        addCategoriesToCategoriesArrayBasedOnCompletion()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func addDetailStatsToStatsArrayBasedOnCompletion() {
        
        if self.progressToDisplay?.isGoalAcheived == false {
            
            self.detailStats = ["\(self.progressToDisplay?.goal?.name)", "\(self.progressToDisplay?.goal?.startDate)", "\(self.progressToDisplay?.goal?.cost)", "\(self.progressToDisplay?.giveUpItem?.name)", "\(self.progressToDisplay?.mostRecentSacrifice)", "\(self.progressToDisplay?.giveUpItem?.frequency)", "\(self.progressToDisplay?.giveUpItem?.cost)", "\(self.progressToDisplay?.numberOfSacrifices)","\(self.progressToDisplay?.sacrificesToGoal)", "\(self.progressToDisplay?.currentSavingsTotal)", "\(self.progressToDisplay?.dollarsToGoal)", "\(self.progressToDisplay?.initialDaysToGoal)"]
            
        } else {
            
            self.detailStats = ["\(self.progressToDisplay?.goal?.name)", "\(self.progressToDisplay?.goal?.startDate)", "\(self.progressToDisplay?.goal?.cost)", "\(self.progressToDisplay?.giveUpItem?.name)", "\(self.progressToDisplay?.giveUpItem?.frequency)", "\(self.progressToDisplay?.giveUpItem?.cost)", "\(self.progressToDisplay?.numberOfSacrifices)", "\(self.progressToDisplay?.currentSavingsTotal)", "\(self.progressToDisplay?.mostRecentSacrifice)"]
            
            
        }
        
        
        
    }
    
    func addCategoriesToCategoriesArrayBasedOnCompletion() {
        
        if self.progressToDisplay?.isGoalAcheived == false {
            
            self.detailCategories = ["Goal Name:", "Goal Started:", "Goal Cost:", "Skip Item:", "Last Skip", "Skip Frequency:", "Skip Cost:", "Total Skips:", "Skips to Goal:", "Total Savings:", "Dollars to Goal:", "Days to Goal:"]
            
        } else {
            
            self.detailCategories = ["Goal Name:", "Goal Started:", "Goal Cost:", "Skip Item:", "Skip Frequency:", "Skip Cost:", "Total Skips:", "Total Savings:", "Date Completed:"]
            
        }
        
    }
    
    
    @IBAction func doneTapped(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    
}
