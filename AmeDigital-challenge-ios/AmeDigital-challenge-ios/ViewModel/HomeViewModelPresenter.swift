//
//  HomeViewModel.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 25/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

class HomeViewModelPresenter: ViewModelPresenter {
    
    func fetchBanner(completion: @escaping (FetchResult) -> Void) {
        self.aLodjinhaAPI.getBanner(onSuccess: {
            bannerList in
            let bannerListViewModel: BannerListViewModel = self.parseBanner(bannerList: bannerList)
            completion(.success(bannerListViewModel))
        }) {
            error in
            completion(.failure(error))
        }
    }
    
    func parseBanner(bannerList: BannerList) -> BannerListViewModel {
        var bannerListViewModel: BannerListViewModel = BannerListViewModel(items: [])
        for banner in bannerList.data {
            var bannerViewModel = BannnerViewModel()
            bannerViewModel.urlImage = URL(string: banner.urlImagem)
            bannerViewModel.urlLink = URL(string: banner.linkUrl)
            bannerListViewModel.items.append(bannerViewModel)
        }
        return bannerListViewModel
    }
    
    func fetchCategories(completion: @escaping (FetchResult) -> Void) {
        self.aLodjinhaAPI.getCategories(onSuccess: {
            categoryList in
            let categoryListViewModel: ProductCategoryListViewModel = self.parseCategories(categoryList: categoryList)
            completion(.success(categoryListViewModel))
        }) {
            error in
            completion(.failure(error))
        }
    }
    
    func parseCategories(categoryList: ProductCategoryList) -> ProductCategoryListViewModel {
        var categoryListViewModel: ProductCategoryListViewModel = ProductCategoryListViewModel(items: [])
        for category in categoryList.data {
            var categoryViewModel = ProductCategoryViewModel()
            categoryViewModel.id = category.id
            categoryViewModel.name = category.descricao
            categoryViewModel.urlImage = URL(string: category.urlImagem)
            categoryListViewModel.items.append(categoryViewModel)
        }
        return categoryListViewModel
    }
    
    func fetchTopSellingProducts(completion: @escaping (FetchResult) -> Void) {
        
        self.aLodjinhaAPI.getTopSellingProducts(onSuccess: {
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
