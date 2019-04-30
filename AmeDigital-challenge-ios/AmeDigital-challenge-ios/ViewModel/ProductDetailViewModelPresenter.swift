//
//  ProductDetailViewModelPresenter.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 29/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

class ProductDetailViewModelPresenter: ViewModelPresenter {

    func reserveProduct(productID: Int, completion: @escaping (FetchResult) -> Void) {
        self.aLodjinhaAPI.postProduct(productID: productID, onSuccess: {
            reserveProduct in
            let reserveProductViewModel: ReserveProductViewModel = self.parseReserveProduct(reserveProduct: reserveProduct)
            completion(.success(reserveProductViewModel))
        }) {
            error in
            completion(.failure(error))
        }
    }
    
    func parseReserveProduct(reserveProduct: ReserveProduct) -> ReserveProductViewModel {
        var reserveProductViewModel: ReserveProductViewModel = ReserveProductViewModel()
        reserveProductViewModel.result = reserveProduct.result == "success" ? true : false
        return reserveProductViewModel
    }
}
