//
//  ALodjinhaAPI.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 25/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit
import Alamofire

class ALodjinhaAPI: NSObject {

    let sessionManager: SessionManager = Alamofire.SessionManager.default
    let baseUrl = "https://alodjinha.herokuapp.com"
    
    func getBanner(onSuccess: @escaping (BannerList) -> (), onError: @escaping (Error) -> ()) {
        
        let requestPath: String = "\(baseUrl)/banner"
        self.sessionManager
            .request(requestPath)
            .validate()
            .responseJSON {
                response in
                
                guard response.result.error == nil else {
                    onError(response.result.error!)
                    return
                }
                
                guard let data = response.data else {
                    onError(response.error!)
                    return
                }
                
                do{
                    let bannerList = try JSONDecoder().decode(BannerList.self, from: data)
                    onSuccess(bannerList)
                }
                catch{
                    onError(error)
                }
        }
    }
    
    func getCategories(onSuccess: @escaping (ProductCategoryList) -> (), onError: @escaping (Error) -> ()) {
        
        let requestPath: String = "\(baseUrl)/categoria"
        self.sessionManager
            .request(requestPath)
            .validate()
            .responseJSON {
                response in
                
                guard response.result.error == nil else {
                    onError(response.result.error!)
                    return
                }
                
                guard let data = response.data else {
                    onError(response.error!)
                    return
                }
                
                do{
                    let categoryList = try JSONDecoder().decode(ProductCategoryList.self, from: data)
                    onSuccess(categoryList)
                }
                catch{
                    onError(error)
                }
        }
    }
    
    func getProducts(offset: Int, limit: Int, categoryID: Int, onSuccess: @escaping (ProductList) -> (), onError: @escaping (Error) -> ()) {
        
        let requestPath: String = "\(baseUrl)/produto?categoriaId=\(categoryID)&limit=\(limit)&offset=\(offset)"
        self.sessionManager
            .request(requestPath)
            .validate()
            .responseJSON {
                response in
                
                guard response.result.error == nil else {
                    onError(response.result.error!)
                    return
                }
                
                guard let data = response.data else {
                    onError(response.error!)
                    return
                }
                
                do{
                    let productList = try JSONDecoder().decode(ProductList.self, from: data)
                    onSuccess(productList)
                }
                catch{
                    onError(error)
                }
        }
    }
    
    func getTopSellingProducts(onSuccess: @escaping (ProductList) -> (), onError: @escaping (Error) -> ()) {
        
        let requestPath: String = "\(baseUrl)/produto/maisvendidos"
        self.sessionManager
            .request(requestPath)
            .validate()
            .responseJSON {
                response in
                
                guard response.result.error == nil else {
                    onError(response.result.error!)
                    return
                }
                
                guard let data = response.data else {
                    onError(response.error!)
                    return
                }
                
                do{
                    let productList = try JSONDecoder().decode(ProductList.self, from: data)
                    onSuccess(productList)
                }
                catch{
                    onError(error)
                }
        }
    }
    
    func getProduct(productID: Int, onSuccess: @escaping (Product) -> (), onError: @escaping (Error) -> ()) {
        
        let requestPath: String = "\(baseUrl)/produto/\(productID)"
        self.sessionManager
            .request(requestPath)
            .validate()
            .responseJSON {
                response in
                
                guard response.result.error == nil else {
                    onError(response.result.error!)
                    return
                }
                
                guard let data = response.data else {
                    onError(response.error!)
                    return
                }
                
                do{
                    let product = try JSONDecoder().decode(Product.self, from: data)
                    onSuccess(product)
                }
                catch{
                    onError(error)
                }
        }
    }
    
    func postProduct(productID: Int, onSuccess: @escaping (ReserveProduct) -> (), onError: @escaping (Error) -> ()) {
            
            let requestPath: String = "\(baseUrl)/produto/\(productID)"
            self.sessionManager.request(requestPath, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate()
                .responseJSON {
                    response in
                    
                    guard response.result.error == nil else {
                        onError(response.result.error!)
                        return
                    }
                    
                    guard let data = response.data else {
                        onError(response.error!)
                        return
                    }
                    
                    do{
                        let reserveProduct = try JSONDecoder().decode(ReserveProduct.self, from: data)
                        onSuccess(reserveProduct)
                    }
                    catch{
                        onError(error)
                    }
            }
    }
}
