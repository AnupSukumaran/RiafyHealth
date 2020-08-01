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
    
    init(data: Data) throws {
        super.init()
        homeModel = try? JSONDecoder().decode(HomeModel.self, from: data)
    }
}
