//
//  Product.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 27/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import Foundation

struct Product: Codable {
    var id: Int
    var nome: String
    var urlImagem: String
    var descricao: String
    var precoDe: Double
    var precoPor: Double
    var categoria: ProductCategory
}
