//
//  HomeViewModel.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit

class HomeViewModel: NSObject {
    
    override init() {
        super.init()
        callHomeAPI()
    }
    
    func callHomeAPI() {
        APILibrary.shared.apiGetHome { (response) in
            switch response {
            case.success(let data):
                let homeData = data.homeModel
                print("homeData = \(homeData)")
                
            case .failure(errorStr: let errStr, model: _):
                print("errStr = \(errStr)")
                
            }
        }
    }

}
