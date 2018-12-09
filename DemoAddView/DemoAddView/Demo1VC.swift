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
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.configContent("secondVC", "Ice Tea")
        headerView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        NotificationCenter.default.addObserver(self, selector: #selector(changeTitleNextButton), name: ViewController.changeContentNotification, object: nil)
       
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       //NotificationCenter.default.removeObserver(self, name: .hihiTitleNoti, object: nil)
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        let thirdVC = self.instantiateViewController(fromStoryboard: .main, ofType: Demo2VC.self)
        self.navigationController?.pushViewController(thirdVC, animated: true)
    }
    
}

extension Demo1VC: DemoViewProtocol {
    func backButtonTapped() {
        NotificationCenter.default.post(name: .hihiTitleNoti, object: nil, userInfo: nil)
        self.navigationController?.popViewController(animated: true)
    }
}

