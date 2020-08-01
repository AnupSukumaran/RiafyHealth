//
//  ModelResponse.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation


class ModelResponse: NSObject, Codable {
    
    var homeModel: HomeModel?
    var healthDataModel: HealthDataModel?
    
    init(data: Data) throws {
        super.init()
        homeModel = try? JSONDecoder().decode(HomeModel.self, from: data)
        healthDataModel = try? JSONDecoder().decode(HealthDataModel.self, from: data)
    }
}
