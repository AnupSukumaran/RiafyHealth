//
//  GetMoreHealthHeaderCell.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 04/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation

class GetMoreHealthHeaderCell: CellConfigModel {
    
    var celltype: CellType {
        return .getMorehealth
    }
    
    var rowCount: Int {
        return 1
    }
    
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    
}
