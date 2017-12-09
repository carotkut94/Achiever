//
//  UIViewControllerExt.swift
//  Achiever
//
//  Created by Death Code on 09/12/17.
//  Copyright © 2017 death code. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    func presentDetails(_ viewController: UIViewController){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        present(viewController, animated: false, completion: nil)
    }
    
    func dismissDetails(_ viewController: UIViewController){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        present(viewController, animated: false, completion: nil)
    }
}
