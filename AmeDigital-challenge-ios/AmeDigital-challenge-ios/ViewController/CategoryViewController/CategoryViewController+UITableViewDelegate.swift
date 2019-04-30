//
//  CategoryViewController+UITableViewDelegate.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 28/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

extension CategoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedProductViewModel = self.productListViewModel.items[indexPath.row]
        self.performSegue(withIdentifier: "categoryToProductDetail", sender: self)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = self.productListViewModel.items.count - 1
        if indexPath.row == lastItem {
            self.fetchProducts(offset: lastItem + 1)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


