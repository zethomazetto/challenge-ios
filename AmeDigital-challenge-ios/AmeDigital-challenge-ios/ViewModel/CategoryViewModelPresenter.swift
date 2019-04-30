//
//  CategoryViewModelPresenter.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 28/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

class CategoryViewModelPresenter: ViewModelPresenter {

    func fetchProductsCategory(categoryID: Int, offset: Int, completion: @escaping (FetchResult) -> Void) {
        self.aLodjinhaAPI.getProducts(offset: offset, limit: 20, categoryID: categoryID, onSuccess: {
            productList in
            let productListViewModel: ProductListViewModel = self.parseProducts(productList: productList)
            completion(.success(productListViewModel))
        }) { error in
            completion(.failure(error))
        }
    }
    
    func parseProducts(productList: ProductList) -> ProductListViewModel {
        var productListViewModel: ProductListViewModel = ProductListViewModel(items: [])
        for product in productList.data {
            var productViewModel = ProductViewModel()
            productViewModel.id = product.id
            productViewModel.name = product.nome
            productViewModel.urlImage = URL(string: product.urlImagem)
            productViewModel.description = product.descricao
            productViewModel.priceFrom = String(format: "De %0.2f", product.precoDe)
            productViewModel.priceTo = String(format: "Por %0.2f", product.precoPor)
            productViewModel.productCategory = self.parseCategory(productCategory: product.categoria)
            productListViewModel.items.append(productViewModel)
        }
        return productListViewModel
    }
    
    func parseCategory(productCategory: ProductCategory) -> ProductCategoryViewModel {
        var productCategoryViewModel: ProductCategoryViewModel = ProductCategoryViewModel()
        productCategoryViewModel.id = productCategory.id
        productCategoryViewModel.name = productCategory.descricao
        productCategoryViewModel.urlImage = URL(string: productCategory.urlImagem)
        return productCategoryViewModel
    }
}
