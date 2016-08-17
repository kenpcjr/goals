//
//  GoalDetailViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 8/17/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit

class GoalDetailViewController: UIViewController {
    
    var progressToDisplay: ProgressMonitor?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
//        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.removeConstraints(self.view.constraints)
        
        let nameLabel = UILabel.init()
        nameLabel.text = progressToDisplay?.goal?.name
        self.view.addSubview(nameLabel)
        nameLabel.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        nameLabel.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
        
        
        
        
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

}
