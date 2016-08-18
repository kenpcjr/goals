//
//  UserStatsViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 8/17/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit

class UserStatsViewController: UIViewController {
    
    @IBOutlet weak var lifetimeSavingsLabel: UILabel!
    @IBOutlet weak var goalsAcheivedLabel: UILabel!
    @IBOutlet weak var totalSkipsLabel: UILabel!
    
    
    let dataStore = DataStore.sharedManager

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lifetimeSavingsLabel.text = "\(dataStore.userContainer[0].lifetimeTotalSaved)"
        self.goalsAcheivedLabel.text = "\(dataStore.userContainer[0].numberOfGoalsMet)"
        self.totalSkipsLabel.text = "\(dataStore.userContainer[0].totalSacrifices)"
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func doneTapped(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

}
