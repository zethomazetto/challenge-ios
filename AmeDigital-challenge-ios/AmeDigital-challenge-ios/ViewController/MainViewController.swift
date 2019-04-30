//
//  MainViewController.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 29/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let defaultAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showError(error: Error, action: UIAlertAction){
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(message: String, action: UIAlertAction){
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
