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
        
        self.exploreButton.enabled = false
        self.hideKeyboardWhenTappedAround()
        
        
        let backNav = UIBarButtonItem()
        backNav.title = ""
        navigationItem.backBarButtonItem = backNav
        
        
    }
    
    @IBAction func giveUpItemEditing(sender: AnyObject) {
        
        if LanguageHandling.validateItemName(self.itemTextField) {
            
            self.exploreButton.enabled = true
            
        } else {
            
            self.exploreButton.enabled = false
            
        }
        
    }
    
 
    
    @IBAction func exploreTapped(sender: AnyObject) {
        
        
        var giveUpNameProper = self.itemTextField.text!
        
        giveUpNameProper.editTextForStorage()
        
        setUpNewGiveUpItem(giveUpNameProper)
        
       
        
    }
    
    func setUpNewGiveUpItem(giveUpItemName: String) {
        
        let newGiveUpItem = NSEntityDescription.insertNewObjectForEntityForName("GiveUpItem", inManagedObjectContext: dataStore.managedObjectContext) as! GiveUpItem
        
        dataStore.userContainer[0].tempGoal?.giveUpItem = newGiveUpItem
        
        dataStore.userContainer[0].tempGoal?.giveUpItem?.name = giveUpItemName
        
        
    }
    
    
}
