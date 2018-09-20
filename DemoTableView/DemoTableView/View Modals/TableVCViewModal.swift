//
//  TableVCViewModal.swift
//  DemoTableView
//
//  Created by Hoàng Hải on 9/20/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TableVCViewModal {
    var buttons = Variable([Button]())
    
    init() {
        buttons.value = [Button(1, "Test"),
                   Button(2, "Approve"),
                   Button(3, "View Result")]
    }
}
