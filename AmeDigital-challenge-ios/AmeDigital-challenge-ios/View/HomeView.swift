//
//  HomeView.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 23/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit
import FSPagerView

class HomeView: MainView {

    @IBOutlet weak var bannerPagerView: FSPagerView!{
        didSet {
            self.bannerPagerView.register(BannerPagerViewCell.self, forCellWithReuseIdentifier: "BannerPagerViewCell")
        }
    }
    
    @IBOutlet weak var categoryListCollectionView: UICollectionView!{
        didSet{
            self.categoryListCollectionView.layer.borderWidth = 0.3
            self.categoryListCollectionView.layer.borderColor = UIColor.gray.cgColor
            self.categoryListCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        }
    }
    @IBOutlet weak var topSellingProductsTableView: UITableView!{
        didSet{
            self.topSellingProductsTableView.register(UINib(nibName: "ProductTableViewCell", bundle: .main), forCellReuseIdentifier: "ProductTableViewCell")
        }
    }

//    override func layoutSubviews() {
//        super.layoutSubviews()
//        self.registerCategoryCell()
//    }
//    
//    func registerCategoryCell() {
//        self.categoryListCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
//    }
}

