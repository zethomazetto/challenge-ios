//
//  HomeViewController+UICollectionViewDelegate.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 23/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        self.selectedProductCategoryViewModel = self.categoryListViewModel.items[indexPath.row]
        self.performSegue(withIdentifier: "homeToCategory", sender: self)
    }
}
