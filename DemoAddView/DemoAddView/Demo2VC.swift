//
//  Demo2VC.swift
//  DemoAddView
//
//  Created by Hoàng Hải on 11/11/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class Demo2VC: UIViewController {
    
    @IBOutlet weak var headerView: DemoView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.configContent("ThirdVC", "ahihi ICE TEA")
        headerView.delegate = self
    }
    
}

extension Demo2VC: DemoViewProtocol {
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

