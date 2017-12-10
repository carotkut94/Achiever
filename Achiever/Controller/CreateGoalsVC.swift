//
//  CreateGoalsVC.swift
//  Achiever
//
//  Created by Death Code on 09/12/17.
//  Copyright © 2017 death code. All rights reserved.
//

import UIKit

class CreateGoalsVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var goalTextField: UITextView!
    var goalType : GoalType = .shortTerm
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindKeyBoard()
        shortTermButton.setSelectedColor()
        longTermButton.setUnSelectedColor()
        goalTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        if goalTextField != nil && goalTextField.text != "What is your goal ?"
        {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "finishGoalVC") as? FinishGoalVC else{
                return
            }
            finishGoalVC.initData(description: goalTextField.text!, type: goalType)
            presentingViewController?.presentOtherViewController(finishGoalVC)
        }
    }
    
    @IBAction func shortTermButtonPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermButton.setSelectedColor();
        longTermButton.setUnSelectedColor()
    }
    @IBAction func longTermButtonPressed(_ sender: Any) {
        goalType = .longTerm
        shortTermButton.setUnSelectedColor();
        longTermButton.setSelectedColor()
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        dismissDetails()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextField.text = ""
        goalTextField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
