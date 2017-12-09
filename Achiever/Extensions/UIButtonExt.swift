//
//  UIButtonExt.swift
//  Achiever
//
//  Created by Death Code on 09/12/17.
//  Copyright © 2017 death code. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    func setSelectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
    }
    func setUnSelectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.6237603445, green: 0.8370330149, blue: 0.6509898566, alpha: 1)
    }
}
