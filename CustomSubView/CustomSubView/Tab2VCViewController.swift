//
//  Tab2VCViewController.swift
//  CustomSubView
//
//  Created by Hoàng Hải on 12/9/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import WebKit

class Tab2VCViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.scrollView.contentInsetAdjustmentBehavior = .automatic
        webView.scrollView.bounces = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let url = URL(string: "https://www.apple.com") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }

}
