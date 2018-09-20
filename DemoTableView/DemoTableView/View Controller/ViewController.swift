//
//  ViewController.swift
//  DemoTableView
//
//  Created by Hoàng Hải on 9/20/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModal = StartVCViewModal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func NextScreenTapped(_ sender: Any) {
        let randomNumber = viewModal.getRandomNumber()
        let tableVC = UIStoryboard.init(name: "Main", bundle: Bundle.main)
            .instantiateViewController(withIdentifier: "TableVC") as? TableVC
        tableVC?.zone = randomNumber
        self.navigationController?.pushViewController(tableVC!, animated: true)
        print("\(randomNumber)")
    }
    
}

