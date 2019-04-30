//
//  CategoryView.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 23/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

class CategoryView: MainView {

    @IBOutlet weak var productListTableView: UITableView!{
        didSet{
            self.productListTableView.register(UINib(nibName: "ProductTableViewCell", bundle: .main), forCellReuseIdentifier: "ProductTableViewCell")
        }
    }
}
