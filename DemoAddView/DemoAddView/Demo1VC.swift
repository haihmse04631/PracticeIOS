//
//  Demo1VC.swift
//  DemoAddView
//
//  Created by Hoàng Hải on 11/11/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class Demo1VC: UIViewController {
    
    @IBOutlet weak var headerView: DemoView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.configContent("secondVC", "Ice Tea")
        headerView.delegate = self
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        let thirdVC = self.instantiateViewController(fromStoryboard: .main, ofType: Demo2VC.self)
        self.navigationController?.pushViewController(thirdVC, animated: true)
    }
    
}

extension Demo1VC: DemoViewProtocol {
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

