//
//  AchiveGoals.swift
//  Achiever
//
//  Created by Death Code on 08/12/17.
//  Copyright © 2017 death code. All rights reserved.
//

import UIKit
import CoreData
class AchiveGoals: UIViewController {

    @IBOutlet weak var tabelView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.delegate = self
        tabelView.dataSource = self
        tabelView.isHidden = false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func addGoals(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "createGoalVC")else {
            print("Error")
            return
        }
        presentDetails(createGoalVC)
    }
}

extension AchiveGoals : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tabelView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {
            return UITableViewCell()
        }
        cell.configureCell(description: "Eat salad for 4 weeks daily", type: .longTerm, goalProgress: 2)
        return cell
    }
}
