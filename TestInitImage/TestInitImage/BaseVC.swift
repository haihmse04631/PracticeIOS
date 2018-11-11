//
//  BaseVC.swift
//  TestInitImage
//
//  Created by Hoàng Hải on 11/7/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import WebKit

class BaseVC: UIViewController {
    
    func loadWebView(webView: WKWebView, link: String) {
        if let url = URL(string: link) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
}
