//
//  ProductDetailView.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 28/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit
import AlamofireImage

class ProductDetailView: UIView {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceFromLabel: UILabel!
    @IBOutlet weak var productPriceToLabel: UILabel!
    @IBOutlet weak var priceView: UIView!{
        didSet{
            self.priceView.layer.borderWidth = 0.3
            self.priceView.layer.borderColor = UIColor.gray.cgColor
        }
    }
    @IBOutlet weak var productDescriptionTextView: UITextView!
    @IBOutlet weak var reserveProductButton: UIButton!{
        didSet{
            self.reserveProductButton.layer.cornerRadius = 5
        }
    }

    func configureView(productViewModel: ProductViewModel) {
        self.productImageView.af_setImage(withURL: productViewModel.urlImage!)
        self.productNameLabel.text = productViewModel.name
        self.productPriceFromLabel.text = productViewModel.priceFrom
        self.productPriceToLabel.text = productViewModel.priceTo
        self.productDescriptionTextView.attributedText = productViewModel.description.htmlToAttributedString
    }
}
