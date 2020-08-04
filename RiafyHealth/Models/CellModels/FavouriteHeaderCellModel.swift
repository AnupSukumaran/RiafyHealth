//
//  FavouriteHeaderCellModel.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 04/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation

class FavouriteHeaderCellModel: CellConfigModel {
    
    var celltype: CellType {
        return .favHeader
    }
    
    var rowCount: Int {
        return 1
    }
    
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    
}
