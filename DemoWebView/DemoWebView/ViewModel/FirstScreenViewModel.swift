//
//  FirstScreenViewModel.swift
//  DemoWebView
//
//  Created by Hoàng Hải on 10/3/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import Foundation

class FirstScreenViewModel {
    var images = [SlideItem]()
    
    init() {
        self.images = [ SlideItem(1, UIImage(named: "ic_car1")!),
                        SlideItem(2, UIImage(named: "ic_car2")!),
                        SlideItem(3, UIImage(named: "ic_car3")!),
                        SlideItem(4, UIImage(named: "ic_car4")!),
                        SlideItem(5, UIImage(named: "ic_car1")!),
                        SlideItem(6, UIImage(named: "ic_car2")!),
                        SlideItem(8, UIImage(named: "ic_car3")!),
                        SlideItem(9, UIImage(named: "ic_car4")!),
                        SlideItem(10, UIImage(named: "ic_car1")!)
                      ]
    }
    
}
