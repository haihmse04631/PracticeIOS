//
//  DemoView.swift
//  DemoAddView
//
//  Created by Hoàng Hải on 11/11/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

protocol DemoViewProtocol: class {
    func backButtonTapped()
}

class DemoView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!

    weak var delegate: DemoViewProtocol?

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("DemoView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func configContent(_ header: String, _ title: String, _ isHiddenBackButton: Bool = false) {
        headerLabel.text = header
        titleLabel.text = title
        backButton.isHidden = isHiddenBackButton
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        delegate?.backButtonTapped()
    }
    
}
