//
//  HomeViewController.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 22/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit


class HomeViewController: MainViewController {
    
    @IBOutlet var homeView: HomeView!
    var homeViewModel: HomeViewModelPresenter = HomeViewModelPresenter()
    var bannerListViewModel: BannerListViewModel = BannerListViewModel()
    var categoryListViewModel: ProductCategoryListViewModel = ProductCategoryListViewModel()
    var productListViewModel: ProductListViewModel = ProductListViewModel()
    var selectedProductCategoryViewModel: ProductCategoryViewModel = ProductCategoryViewModel()
    var selectedProductViewModel: ProductViewModel = ProductViewModel()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setImageTitle()
        self.fetchInfo()
    }
    
    func fetchInfo() {
        let bannerSpinner = self.homeView.setupSpinner(view: self.homeView.bannerPagerView)
        bannerSpinner.startAnimating()
        homeViewModel.fetchBanner {
            result in
            switch result{
            case .success(let bannerListViewModel):
                self.bannerListViewModel = bannerListViewModel as! BannerListViewModel
                self.homeView.bannerPagerView.reloadData()
                bannerSpinner.stopAnimating()
            case .failure(let error):
                self.showError(error: error, action: self.defaultAlertAction)
            }
        }
        
        let categoriesSpinner = self.homeView.setupSpinner(view: self.homeView.categoryListCollectionView)
        categoriesSpinner.startAnimating()
        homeViewModel.fetchCategories {
            result in
            switch result{
            case .success(let categoryListViewModel):
                self.categoryListViewModel = categoryListViewModel as! ProductCategoryListViewModel
                self.homeView.categoryListCollectionView.reloadData()
                categoriesSpinner.stopAnimating()
            case .failure(let error):
                self.showError(error: error, action: self.defaultAlertAction)
            }
        }
        
        let productsSpinner = self.homeView.setupSpinner(view: self.homeView.topSellingProductsTableView)
        productsSpinner.startAnimating()
        homeViewModel.fetchTopSellingProducts {
            result in
            switch result{
            case .success(let productListViewModel):
                self.productListViewModel = productListViewModel as! ProductListViewModel
                self.homeView.topSellingProductsTableView.reloadData()
                productsSpinner.stopAnimating()
            case .failure(let error):
                self.showError(error: error, action: self.defaultAlertAction)
            }
        }
    }
    
    func setImageTitle() {
        let imageview = UIImageView(image: UIImage(named: "logoNavbar"))
        self.navigationItem.titleView = imageview
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let categoryViewController = segue.destination as? CategoryViewController {
            categoryViewController.productCategoryViewModel = self.selectedProductCategoryViewModel
        }
        if let productDetailViewController = segue.destination as? ProductDetailViewController {
            productDetailViewController.productViewModel = self.selectedProductViewModel
        }
    }
}
