//
//  AboutViewController.swift
//  Priority
//
//  Created by Kenneth Cooke on 8/22/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

    @IBAction func doneTapped(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
}
