//
//  MenuVC.swift
//  TestInitImage
//
//  Created by Hoàng Hải on 11/7/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {
    
    var didSelectedMenuItem: ((_ index: Int) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func menu1ButtonTapped(_ sender: Any) {
        let detailVC = self.instantiateViewController(fromStoryboard: .main, ofType: DetailVC.self)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func menu2ButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        didSelectedMenuItem?(2)
    }

}
