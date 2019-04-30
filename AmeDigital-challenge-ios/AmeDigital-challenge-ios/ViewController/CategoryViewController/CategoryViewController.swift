//
//  CategoryViewController.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 23/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

class CategoryViewController: MainViewController {

    @IBOutlet var categoryView: CategoryView!
    var categoryViewModelPresenter: CategoryViewModelPresenter = CategoryViewModelPresenter()
    var productListViewModel: ProductListViewModel = ProductListViewModel()
    var productCategoryViewModel: ProductCategoryViewModel = ProductCategoryViewModel()
    var selectedProductViewModel: ProductViewModel = ProductViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchProducts(offset: 0)
        self.title = self.productCategoryViewModel.name
    }
    
    func fetchProducts(offset: Int) {
        categoryViewModelPresenter.fetchProductsCategory(categoryID: self.productCategoryViewModel.id, offset: offset) {
            result in
            switch result{
            case .success(let productListViewModel):
                let newResults = productListViewModel as! ProductListViewModel
                self.productListViewModel.items.append(contentsOf: newResults.items)
                let indexPaths = (self.productListViewModel.items.count - newResults.items.count ..< self.productListViewModel.items.count)
                    .map { IndexPath(row: $0, section: 0) }
                self.categoryView.productListTableView.beginUpdates()
                self.categoryView.productListTableView.insertRows(at:indexPaths, with: .automatic)
                self.categoryView.productListTableView.endUpdates()
            case .failure(let error):
                self.showError(error: error, action: self.defaultAlertAction)
            }
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productDetailViewController = segue.destination as? ProductDetailViewController {
            productDetailViewController.productViewModel = self.selectedProductViewModel
        }
    }
}
