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
    
    let settings = ["Share Goal Status", "Current Goal Details", "Modify Current Goal", "Create New Goal", "User Stats","View Completed Goals", "Notifications", "About Priority"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let tableViewDelegate = SettingsTableView()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return settings.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("basicCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = settings[indexPath.row]
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cellTapped = self.settings[indexPath.row]
        
        print(cellTapped)
        
        switch cellTapped {
        case "Modify Current Goal":
            
            self.performSegueWithIdentifier("adjustGoal", sender: nil)
            print("Adjust")
            
            case "User Stats":
                
                print("Stats")
            
            self.performSegueWithIdentifier("userStats", sender: nil)
            
            
            
            case "Create New Goal":
            
            self.performSegueWithIdentifier("newGoal", sender: nil)
            
            print("New Goal")
            
            case "View Completed Goals":
            
            self.performSegueWithIdentifier("pastGoals", sender: nil)
            
        default:
            
            print("No match")
            
        }
        
    }
    
    @IBAction func doneTapped(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
}
