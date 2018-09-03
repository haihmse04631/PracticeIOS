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
    }
    
    init(_ id: Int, _ name: String, _ desc: String) {
        self.id = id
        self.name = name
        self.desc = desc
    }
}
