//
//  ViewController.swift
//  DemoApp
//
//  Created by Hoàng Hải on 6/21/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        abcLabel.text = "đâsd đâsd ádas đá ád ádas da"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBOutlet weak var abcLabel: UILabel!
    
}

