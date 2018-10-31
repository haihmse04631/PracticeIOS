//
//  CollectionViewCell.swift
//  TestInitImage
//
//  Created by Hoàng Hải on 10/31/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCell(image: UIImage){
        imageView.image = image
    }
    
}
