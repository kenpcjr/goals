//
//  PurchaseSkipViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 7/30/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit

class PurchaseSkipViewController: UIViewController {
    
    let dataStore = DataStore.sharedManager
    
    var monitor: ProgressMonitor?
    
    @IBOutlet weak var aboutToSkipLabel: UILabel!
    @IBOutlet weak var potentialSkipTotalLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monitor = dataStore.userContainer[0].goalInProgress
        if let item = monitor?.giveUpItem!.name {
            
            self.aboutToSkipLabel.text = "Great, you're about to skip a purchase of \(item)"
            
        }
        
        if let currentSavings = monitor?.currentSavingsTotal, itemCost = monitor?.giveUpItem!.cost {
            
            let potentialSkipTotal = currentSavings + Double(itemCost)
            
            self.potentialSkipTotalLabel.text = "$\(potentialSkipTotal)"
            
        }
    }
    
    @IBAction func skipTapped(sender: AnyObject) {
        
        var sacrifices = Int((dataStore.userContainer[0].goalInProgress?.numberOfSacrifices)!)
        
        sacrifices += 1
        
        dataStore.userContainer[0].goalInProgress?.numberOfSacrifices = sacrifices
        
        dataStore.userContainer[0].goalInProgress?.mostRecentSacrifice = NSDate.init()
        
        dataStore.saveContext()
        dataStore.fetchData()
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func cancelTapped(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
}
