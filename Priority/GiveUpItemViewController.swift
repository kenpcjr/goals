//
//  GiveUpItemViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 7/27/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit
import CoreData

class GiveUpItemViewController: UIViewController {
    
    let dataStore = DataStore.sharedManager

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var exploreButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.itemTextField.becomeFirstResponder()
        
    }
    
    @IBAction func exploreTapped(sender: AnyObject) {
        
        
        var giveUpNameProper = self.itemTextField.text
        
        if self.itemTextField.text?.hasPrefix("a ") == true {
            
            let giveUpName = self.itemTextField.text?.stringByReplacingOccurrencesOfString("a ", withString: "")
            
            giveUpNameProper = giveUpName
            
        }
        
        if self.itemTextField.text?.hasPrefix("A ") == true {
            
            let giveUpName = self.itemTextField.text?.stringByReplacingOccurrencesOfString("A ", withString: "")
            
            giveUpNameProper = giveUpName
            
        }
        
        if giveUpNameProper!.hasSuffix(" ") {
            
            while giveUpNameProper!.hasSuffix(" ") {
                
                giveUpNameProper!.removeAtIndex(giveUpNameProper!.endIndex.predecessor())
                
            }
            
            
            
        }
        
        let newGiveUpItem = NSEntityDescription.insertNewObjectForEntityForName("GiveUpItem", inManagedObjectContext: dataStore.managedObjectContext) as! GiveUpItem
        
        dataStore.userContainer[0].tempGoal?.giveUpItem = newGiveUpItem
        
        dataStore.userContainer[0].tempGoal?.giveUpItem?.name = giveUpNameProper!
        
    }
    
    
}
