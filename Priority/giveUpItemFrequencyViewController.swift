//
//  giveUpItemFrequencyViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 7/30/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit

class giveUpItemFrequencyViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let dataStore = DataStore.sharedManager
    
    let pickerNumbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9","10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"]
    let pickerFrequencies = ["Per Day", "Per Week"]
    
    @IBOutlet weak var frequencyPicker: UIPickerView!
    @IBOutlet weak var howOftenLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.frequencyPicker.delegate = self
        self.frequencyPicker.dataSource = self
        
        if let text = dataStore.userContainer[0].tempGoal?.giveUpItem?.name {
            
            self.howOftenLabel.text = "How often do you buy \(text)?"
            
        }
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 2
        
    }
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            
            return self.pickerNumbers.count
        }
        
        if component == 1 {
            
            return self.pickerFrequencies.count
            
        }
        
        return 0
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            
            return self.pickerNumbers[row]
            
        }
        
        if component == 1 {
            
            return self.pickerFrequencies[row]
            
        }
        
        return ""
    }
    
    
    
    
    
    
    
    @IBAction func continueTapped(sender: AnyObject) {
        
        
        let frequencyNumber = self.pickerNumbers[self.frequencyPicker.selectedRowInComponent(0)]
        
        if self.frequencyPicker.selectedRowInComponent(1) == 1 {
            
            print("before division \(frequencyNumber)")
            
            let frequencyDecimalAsALargeNumber = (Double(frequencyNumber)! / 7.0) * 10000
            
            dataStore.userContainer[0].tempGoal?.giveUpItem?.frequency = frequencyDecimalAsALargeNumber
            
            print("manual division: \(frequencyDecimalAsALargeNumber)")
            
        } else {
            
            dataStore.userContainer[0].tempGoal?.giveUpItem?.frequency = Int(frequencyNumber)
            
        }
        
        
        print("The number being saved is \(dataStore.userContainer[0].tempGoal?.giveUpItem?.frequency)")
        
    }
}
