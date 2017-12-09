//
//  CreateGoalsVC.swift
//  Achiever
//
//  Created by Death Code on 09/12/17.
//  Copyright © 2017 death code. All rights reserved.
//

import UIKit

class CreateGoalsVC: UIViewController {

    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var goalTextField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        
    }
    
    @IBAction func shortTermButtonPressed(_ sender: Any) {
        
    }
    @IBAction func longTermButtonPressed(_ sender: Any) {
        
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        dismissDetails()
    }
}
