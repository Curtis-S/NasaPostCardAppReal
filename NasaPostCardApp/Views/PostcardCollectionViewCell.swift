//
//  PostcardCollectionViewCell.swift
//  NasaPostCardApp
//
//  Created by curtis scott on 19/06/2020.
//  Copyright © 2020 CurtisScott. All rights reserved.
//

import UIKit

class PostcardCollectionViewCell: UICollectionViewCell {
  
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView.roundImage()
    }
    }
