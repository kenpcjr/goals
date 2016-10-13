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
        
        self.exploreButton.isEnabled = false
        self.hideKeyboardWhenTappedAround()
        
        
        let backNav = UIBarButtonItem()
        backNav.title = ""
        navigationItem.backBarButtonItem = backNav
        
        
    }
    
    @IBAction func giveUpItemEditing(_ sender: AnyObject) {
        
        if LanguageHandling.validateItemName(self.itemTextField) {
            
            self.exploreButton.isEnabled = true
            
        } else {
            
            self.exploreButton.isEnabled = false
            
        }
        
    }
    
 
    
    @IBAction func exploreTapped(_ sender: AnyObject) {
        
        
        var giveUpNameProper = self.itemTextField.text!
        
        giveUpNameProper.editTextForStorage()
        
        setUpNewGiveUpItem(giveUpNameProper)
        
       
        
    }
    
    func setUpNewGiveUpItem(_ giveUpItemName: String) {
        
        let newGiveUpItem = NSEntityDescription.insertNewObject(forEntityName: "GiveUpItem", into: dataStore.managedObjectContext) as! GiveUpItem
        
        dataStore.userContainer[0].tempGoal?.giveUpItem = newGiveUpItem
        
        dataStore.userContainer[0].tempGoal?.giveUpItem?.name = giveUpItemName
        
        
    }
    
    
}
