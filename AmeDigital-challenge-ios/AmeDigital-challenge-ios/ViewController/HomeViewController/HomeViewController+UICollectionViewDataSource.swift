//
//  HomeViewController+UICollectionViewDataSource.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 23/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categoryListViewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.getCategoryCell(collectionView: collectionView, indexPath: indexPath)
        let categoryViewModel = categoryListViewModel.items[indexPath.row]
        cell.configure(categoryViewModel: categoryViewModel)
        return cell
    }
    
    func getCategoryCell(collectionView: UICollectionView, indexPath: IndexPath) -> CategoryCollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
    }
}
