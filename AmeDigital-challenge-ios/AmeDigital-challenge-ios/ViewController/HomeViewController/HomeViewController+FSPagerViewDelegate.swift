//
//  HomeViewController+FSPagerViewDelegate.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 29/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit
import FSPagerView

extension HomeViewController: FSPagerViewDelegate {
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
}
