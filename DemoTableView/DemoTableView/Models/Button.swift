//
//  Button.swift
//  DemoTableView
//
//  Created by Hoàng Hải on 9/20/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class Button: NSObject {
    var id = 0
    var name = String()
    
    init(_ id: Int, _ name: String) {
        super.init()
        self.id = id
        self.name = name
    }
}
