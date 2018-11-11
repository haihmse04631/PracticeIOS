//
//  Tab1VC.swift
//  TestInitImage
//
//  Created by Hoàng Hải on 11/7/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import WebKit

class Tab1VC: BaseVC {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadWebView(webView: webView, link: "https://www.google.com")
    }

}
