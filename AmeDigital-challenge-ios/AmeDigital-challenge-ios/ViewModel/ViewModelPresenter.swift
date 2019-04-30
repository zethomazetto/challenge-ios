//
//  ViewModelPresenter.swift
//  AmeDigital-challenge-ios
//
//  Created by Ezequiel Thomazetto on 28/04/19.
//  Copyright © 2019 Ezequiel Thomazetto. All rights reserved.
//

import UIKit

enum FetchResult {
    case success(ViewModel)
    case failure(Error)
}

class ViewModelPresenter: NSObject {
    var aLodjinhaAPI: ALodjinhaAPI = ALodjinhaAPI()
}
