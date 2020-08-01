//
//  CellConfigModel.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation

enum CellType {
    case activity
    case steps
    case articles
}

protocol CellConfigModel {
    var celltype: CellType {get}
    var rowCount: Int {get}
}
