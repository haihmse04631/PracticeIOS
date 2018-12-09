//
//  CustomTabBar.swift
//  CustomSubView
//
//  Created by Hoàng Hải on 12/9/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBar {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var tabBarView1: UIView!
    @IBOutlet weak var tabBarView2: UIView!
    @IBOutlet weak var tabBarView3: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        let frost = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        frost.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60)
        frost.autoresizingMask = .flexibleWidth
        insertSubview(frost, at: 0)
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("CustomTabBar", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
}
