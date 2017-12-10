//
//  FinishGoalVC.swift
//  Achiever
//
//  Created by Death Code on 09/12/17.
//  Copyright © 2017 death code. All rights reserved.
//

import UIKit
import CoreData
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
        if pointsTextField != nil && pointsTextField.text != ""{
            self.save(completion: { (finished) in
                if finished {
                    dismiss(animated: true, completion: nil)
                }
            })
        }
        
    }
    
    func save(completion:(_ finished:Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{
            return
        }
        let goal = Goal(context: managedContext)
        goal.goalDescription = goalDescription
        goal.goalType = type.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do{
            try managedContext.save()
            debugPrint("Saved")
            completion(true)
        }catch{
            debugPrint("Failed to save\(error.localizedDescription)")
            completion(false)
        }
    }
    
    

}
