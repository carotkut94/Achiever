//
//  GoalCell.swift
//  Achiever
//
//  Created by Death Code on 09/12/17.
//  Copyright © 2017 death code. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {
    
    @IBOutlet weak var goalDescriptionLabel: UILabel!
    @IBOutlet weak var goalType: UILabel!
    @IBOutlet weak var goalProgress: UILabel!
    
    func configureCell(description: String, type: GoalType, goalProgress: Int){
        self.goalDescriptionLabel.text = description
        self.goalType.text = type.rawValue
        self.goalProgress.text = String(describing: goalProgress)
    }
}
