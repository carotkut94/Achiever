//
//  FinishGoalVC.swift
//  Achiever
//
//  Created by Death Code on 09/12/17.
//  Copyright © 2017 death code. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var pointsTextField: UITextField!
    @IBOutlet weak var createGoalButton: UIButton!
    var goalDescription: String!
    var type: GoalType!
    
    func initData(description: String, type: GoalType)
    {
        self.goalDescription = description
        self.type = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //find keyboard animations with the button
        createGoalButton.bindKeyBoard()
        pointsTextField.delegate = self
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismissDetails()
    }
    
    @IBAction func createGoadButtonPressed(_ sender: Any) {
        // Pass data into core data model
        
    }
}
