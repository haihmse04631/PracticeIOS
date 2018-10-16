//
//  ViewController.swift
//  DemoPageMenu
//
//  Created by Hoàng Hải on 10/13/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import PageMenu

class ViewController: UIViewController {
    
    let pageControllers: [UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var viewControllers = [UIViewController]()
        for i in 0 ..< 5 {
            let viewController = storyboard.instantiateViewController(withIdentifier: "PageItemVC") as! PageItemVC
            viewController.title = "adsdasdas"
            viewController.index = i
            viewControllers.append(viewController)
        }
        return viewControllers
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

