//
//  ChildViewController.swift
//  DemoPageBoy
//
//  Created by Hoàng Hải on 10/4/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    
    var index: Int?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let index = self.index else {
            return
        }
        
        switch index {
        case 1:
            backgroundView.backgroundColor = UIColor.blue
            break
        case 2:
            backgroundView.backgroundColor = UIColor.black
            break
        case 3:
            backgroundView.backgroundColor = UIColor.yellow
            break
        case 4:
            backgroundView.backgroundColor = UIColor.gray
            break
        default:
            backgroundView.backgroundColor = UIColor.red
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
