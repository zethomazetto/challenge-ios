//
//  CategoryCollectionViewCell.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 23/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit
import AlamofireImage

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(categoryViewModel: ProductCategoryViewModel) {
        self.categoryImageView.af_setImage(withURL: categoryViewModel.urlImage!)
        self.categoryLabel.text = categoryViewModel.name
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.categoryImageView.af_cancelImageRequest()
        self.categoryImageView.layer.removeAllAnimations()
        self.categoryImageView.image = nil
    }
}
