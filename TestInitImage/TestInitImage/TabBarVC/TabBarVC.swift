//
//  TabBarVC.swift
//  TestInitImage
//
//  Created by Hoàng Hải on 11/7/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {
    
    var tbSelectedIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
    }
}

extension TabBarVC: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController == tabBarController.viewControllers?[2] {
            if let currentVC = tabBarController.viewControllers?[self.selectedIndex] {
                let menuVC = currentVC.instantiateViewController(fromStoryboard: .main, ofType: MenuVC.self)
                currentVC.present(menuVC, animated: true, completion: nil)
            }
            return false
        } else {
            return true
        }
    }
    
}
