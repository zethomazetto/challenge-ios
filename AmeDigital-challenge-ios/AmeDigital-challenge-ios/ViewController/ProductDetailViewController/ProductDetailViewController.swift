//
//  ProductDetailViewController.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 23/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

class ProductDetailViewController: MainViewController {

    var productViewModel: ProductViewModel = ProductViewModel()
    var productDetailViewModelPresenter: ProductDetailViewModelPresenter = ProductDetailViewModelPresenter()
    @IBOutlet var productDetailView: ProductDetailView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productDetailView.configureView(productViewModel: self.productViewModel)
    }
    

    @IBAction func reserveProduct(_ sender: Any) {
        
        self.productDetailView.reserveProductButton.isEnabled = false
        productDetailViewModelPresenter.reserveProduct(productID: self.productViewModel.id) {
            result in
            switch result{
            case .success(let reserveProductViewModel):
                self.productDetailView.reserveProductButton.isEnabled = true
                self.showAlert(message: (reserveProductViewModel as! ReserveProductViewModel).success, action: self.defaultAlertAction)
                print(reserveProductViewModel)
            case .failure(let error):
                self.showError(error: error, action: self.defaultAlertAction)
            }
        }
    }
}
