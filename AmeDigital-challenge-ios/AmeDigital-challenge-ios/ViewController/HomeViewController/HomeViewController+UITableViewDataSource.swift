//
//  HomeViewController+UITableViewDataSource.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 23/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productListViewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.getProductCell(tableView: tableView, indexPath: indexPath)
        cell.configure(productViewModel: self.productListViewModel.items[indexPath.row])
        return cell
    }
    
    func getProductCell(tableView: UITableView, indexPath: IndexPath) -> ProductTableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
    }
}

