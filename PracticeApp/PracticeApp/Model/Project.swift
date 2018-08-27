//
//  Project.swift
//  PracticeApp
//
//  Created by Hoàng Hải on 8/23/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import Foundation

class Project: NSObject {
    var id = Int()
    var name = ""
    var desc = ""
    
    override init() {
        super.init()
        self.id = 1
        self.name = "CQMS"
        self.desc = "IOS-Team"
    }
}
