//
//  HomeViewController+FSPagerViewDataSource.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 29/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit
import FSPagerView

extension HomeViewController: FSPagerViewDataSource {
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.bannerListViewModel.items.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "BannerPagerViewCell", at: index) as! BannerPagerViewCell
        
        cell.configure(bannnerViewModel: self.bannerListViewModel.items[index])
        return cell
    }
}
