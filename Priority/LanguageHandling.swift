//
//  LanguageHandling.swift
//  Priority
//
//  Created by Kenneth Cooke on 8/28/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import Foundation
import UIKit

class LanguageHandling {
    
    class func validateItemName(textField: UITextField) -> Bool {
        
        let hasContent = textField.text?.characters.count > 0
        let isThreeWordsOrLess = textField.text?.componentsSeparatedByString(" ").count <= 3
        
        if hasContent && isThreeWordsOrLess {
            
            return true
            
        }
        
        return false
        
    }
    
    class func checkForValidPrice(textField: UITextField) -> Bool {
        
        if textField.text == "$0.00" {
            
            return false
            
        }
            
            return true

    }
    
}


extension String {
    
   mutating func removePluralSuffix() {
        
        if self.hasSuffix("s") {
            
            self = String (self.characters.dropLast())
            
        }
        
    }
    
    mutating func editTextForStorage() {
        
        if self.hasPrefix("a ") == true {
            
            self = self.stringByReplacingOccurrencesOfString("a ", withString: "")
            
        }
        
        if self.hasSuffix(" ") == true {
            
            while self.hasSuffix(" ") {
                
                self.removeAtIndex(self.endIndex.predecessor())
                
            }
            
        }
        
        if self.hasPrefix("my ") {
            
            self = self.stringByReplacingOccurrencesOfString("my ", withString: "")
            
        }
        
        
        self = self.capitalizedString
        
    }

    
}


extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
