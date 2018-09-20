//
//  TableViewCell.swift
//  DemoTableView
//
//  Created by Hoàng Hải on 9/20/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgButton: UIImageView!
    @IBOutlet weak var nameButtonLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
