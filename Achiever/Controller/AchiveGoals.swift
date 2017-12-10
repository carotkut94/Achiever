//
//  AchiveGoals.swift
//  Achiever
//
//  Created by Death Code on 08/12/17.
//  Copyright © 2017 death code. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class AchiveGoals: UIViewController {

    @IBOutlet weak var tabelView: UITableView!
    var goals: [Goal] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.delegate = self
        tabelView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData { (finished) in
            if finished {
                if goals.count > 0{
                    tabelView.isHidden = false
                }else{
                    tabelView.isHidden = true
                }
            }
        }
        tabelView.reloadData()
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
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tabelView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {
            return UITableViewCell()
        }
        let goal = goals[indexPath.row]
        cell.configureCell(goal: goal)
        return cell
    }
}

extension AchiveGoals{
    func fetchData(completion : (_ finished:Bool)->()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{
            return
        }
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        do{
            try goals =  managedContext.fetch(fetchRequest)
            completion(true)
        }catch{
            debugPrint("Error occured during fetching data \(error.localizedDescription )")
            completion(false)
        }
    }
}

