//
//  StepsCellModel.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation

class StepsCellModel: CellConfigModel {
    
    var celltype: CellType {
        return .steps
    }
    
    var rowCount: Int {
        return 1
    }
    
    let steps: Steps
    
    init(steps: Steps) {
        self.steps = steps
        
    }
    
    
}
