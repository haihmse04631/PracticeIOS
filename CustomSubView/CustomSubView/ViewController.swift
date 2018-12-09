//
//  ViewController.swift
//  CustomSubView
//
//  Created by Hoàng Hải on 12/6/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var zeroView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLayoutSubviews() {
        findStackView(containerView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zeroButton.titleLabel?.text = "6"
    }

    func makeButtonCircle(_ stackView: UIStackView) {
        for item in stackView.subviews {
            item.layer.cornerRadius = item.bounds.size.width / 2
            item.clipsToBounds = true
        }
    }
    
    func findStackView(_ containerView: UIView) {
        for item in containerView.subviews {
            if item is UIStackView {
                makeButtonCircle(item as? UIStackView ?? UIStackView())
            }
        }
    }

}

