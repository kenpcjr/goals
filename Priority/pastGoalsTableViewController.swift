//
//  pastGoalsTableViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 8/16/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit

class pastGoalsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataStore = DataStore.sharedManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if let goalsComplete = dataStore.userContainer[0].goalsComplete {
            
            return goalsComplete.count
            
        } else {
            
            return 0
        }
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        
        if let goalsComplete = dataStore.userContainer[0].goalsComplete {
            
            let currentGoal = goalsComplete[(indexPath as NSIndexPath).row] as! ProgressMonitor
        
        cell.textLabel?.text = currentGoal.goal?.name
            
        }
     
     // Configure the cell...
     
     return cell
     }
    
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
     
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationViewController = segue.destination as! GoalDetailViewController
        
        let index = (tableView.indexPathForSelectedRow as NSIndexPath?)?.row
        
        if let monitors = dataStore.userContainer[0].goalsComplete, let index = index {
            
            let progressToPass = monitors[index] as! ProgressMonitor
            
            destinationViewController.progressToDisplay = progressToPass
            
        }
        
        
    
     }
    
    @IBAction func doneTapped(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
