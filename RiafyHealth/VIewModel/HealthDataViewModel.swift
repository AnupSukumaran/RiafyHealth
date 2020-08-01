//
//  HealthDataViewModel.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit

class HealthDataViewModel: NSObject {

    override init() {
        super.init()
        callHealthDataAPI()
    }
    
    func callHealthDataAPI() {
        APILibrary.shared.apiGetHealthDataAPI { (response) in
            switch response {
            case.success(let data):
                let healthDataModel = data.healthDataModel
                print("healthDataModel = \(healthDataModel)")
                
                
                
            case .failure(errorStr: let errStr, model: _):
                print("errStr = \(errStr)")
                
            }
        }
    }
}
