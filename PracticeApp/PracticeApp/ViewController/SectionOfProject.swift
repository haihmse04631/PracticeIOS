//
//  SectionOfProject.swift
//  PracticeApp
//
//  Created by Hoàng Hải on 9/3/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import Foundation
import UIKit
import RxDataSources

struct SectionOfProject {
    var header: String
    var items: [Project]
}

extension SectionOfProject: SectionModelType {
    
    typealias Item = Project
    
    init(original: SectionOfProject, items: [Item]) {
        self = original
        self.items = items
    }
    
}


