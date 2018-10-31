//
//  MainViewModel.swift
//  TestInitImage
//
//  Created by Hoàng Hải on 10/31/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class MainViewModel {
    
    static let categorys: [UIImage] = {
        var images = [UIImage]()
        for index in  0...10 {
            images.append(UIImage(named: "ic_setting")!)
        }
        return images
    }()
    
}
