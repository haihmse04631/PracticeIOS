//
//  StartVCViewModals.swift
//  DemoTableView
//
//  Created by Hoàng Hải on 9/20/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class StartVCViewModal {
    var zone = 0
    
    func getRandomNumber() -> Int {
        return Int(arc4random_uniform(3) + 1)
    }
}
