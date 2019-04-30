//
//  ProductTableViewCell.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 23/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit
import AlamofireImage

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceFromLabel: UILabel!
    @IBOutlet weak var productPriceToLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(productViewModel: ProductViewModel) {
//        self.categoryImageView.af_setImage(withURL: categoryViewModel.urlImage!)
//        self.categoryLabel.text = categoryViewModel.name
        
        self.productImageView.af_setImage(withURL: productViewModel.urlImage!)
        self.productNameLabel.text = productViewModel.name
        self.productPriceFromLabel.text = productViewModel.priceFrom
        self.productPriceToLabel.text = productViewModel.priceTo

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.productImageView.af_cancelImageRequest()
        self.productImageView.layer.removeAllAnimations()
        self.productImageView.image = nil
    }
    
}
