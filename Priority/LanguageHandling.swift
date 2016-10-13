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
    
    class func validateItemName(_ textField: UITextField) -> Bool {
        
        guard let text = textField.text else {return false}
        
        let hasContent = text.characters.count > 0
        let isThreeWordsOrLess = text.components(separatedBy: " ").count <= 3
        
        if hasContent && isThreeWordsOrLess {
            
            return true
            
        }
        
        return false
        
    }
    
    class func checkForValidPrice(_ textField: UITextField) -> Bool {
        
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
            
            self = self.replacingOccurrences(of: "a ", with: "")
            
        }
        
        if self.hasSuffix(" ") == true {
            
            while self.hasSuffix(" ") {
                
                self.remove(at: self.characters.index(before: self.endIndex))
                
            }
            
        }
        
        if self.hasPrefix("my ") {
            
            self = self.replacingOccurrences(of: "my ", with: "")
            
        }
        
        
        self = self.capitalized
        
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
