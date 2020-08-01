//
//  ShowFullDataCellModel.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation

class ShowFullDataCellModel: CellConfigModel {
    
    var celltype: CellType {
        return .showAllData
    }
    
    var rowCount: Int {
        return 1
    }
       
    init() {}
    
    
}
