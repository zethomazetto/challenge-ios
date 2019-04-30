//
//  ViewModels.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 25/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import Foundation

protocol ViewModel {
}

struct BannerListViewModel: ViewModel {
    var items: [BannnerViewModel] = []
}

struct BannnerViewModel: ViewModel {
    var urlImage: URL?
    var urlLink: URL?
}

struct ProductCategoryListViewModel: ViewModel {
    var  items: [ProductCategoryViewModel] = []
}

struct ProductCategoryViewModel: ViewModel {
    var id: Int = 0
    var name: String = ""
    var urlImage: URL?
}

struct ProductListViewModel: ViewModel {
    var  items: [ProductViewModel] = []
}

struct ProductViewModel: ViewModel {
    var id: Int = 0
    var name: String = ""
    var urlImage: URL?
    var description: String = ""
    var priceFrom: String = ""
    var priceTo: String = ""
    var productCategory: ProductCategoryViewModel = ProductCategoryViewModel()
}

struct ReserveProductViewModel: ViewModel {
    var result: Bool = false
    var success: String = "Produto reservado com sucesso"
}
