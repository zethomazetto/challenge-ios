//
//  BannerPagerViewCell.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 25/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit
import FSPagerView
import AlamofireImage

class BannerPagerViewCell: FSPagerViewCell {
    
    func configure(bannnerViewModel: BannnerViewModel) {
        self.imageView?.af_setImage(withURL: bannnerViewModel.urlImage!)
        self.imageView?.contentMode = .scaleAspectFill
        self.imageView?.clipsToBounds = true
    }
}
