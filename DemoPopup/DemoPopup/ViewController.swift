//
//  ViewController.swift
//  DemoPopup
//
//  Created by Hoàng Hải on 8/30/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import PopupDialog

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func dialog1Taped(_ sender: Any) {
        
    }
    
    
    @IBAction func dialog2Tapped(_ sender: UIButton) {
        
    }
    
    
    @IBAction func dialog3Tapped(_ sender: UIButton) {
        
    }
    
    private func showSimpleAlert() {
        let popup = PopupDialog(title: "title", message: "message", image: UIImage(named: "nancy-3"))
        
        
    }
    

}

