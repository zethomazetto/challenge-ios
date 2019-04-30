//
//  MainView.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 23/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

class MainView: UIView {

    func setupSpinner(view: UIView) -> UIActivityIndicatorView {
        let spinner: UIActivityIndicatorView = UIActivityIndicatorView(style: .gray)
        spinner.hidesWhenStopped = true
        spinner.center = view.center
        view.addSubview(spinner)
        
        return spinner
    }
}
