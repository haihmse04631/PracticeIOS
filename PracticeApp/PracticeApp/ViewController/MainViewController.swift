//
//  MainViewController.swift
//  PracticeApp
//
//  Created by Hoàng Hải on 8/20/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var project = Project()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func activeButtonTapped(_ sender: Any) {
        project.id += 1
        project.name += " a"
        project.desc += " b"
        
        idLabel.text = "\(project.id)"
        nameLabel.text = project.name
        descLabel.text = project.desc
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
