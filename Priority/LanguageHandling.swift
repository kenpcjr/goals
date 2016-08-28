//
//  LanguageHandling.swift
//  Priority
//
//  Created by Kenneth Cooke on 8/28/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import Foundation

class LanguageHandling {
    

    
}


extension String {
    
   mutating func removePluralSuffix() {
        
        if self.hasSuffix("s") {
            
            self = String (self.characters.dropLast())
            
        }
        
    }
    
    
    
    
    
}
