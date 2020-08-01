//
//  EnvironmentCellModel.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 02/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation

class EnvironmentCellModel: CellConfigModel {
    
    var celltype: CellType {
        return .soundLevel
    }
    
    var rowCount: Int {
        return 1
    }
    
    let soundLevels: SoundLevels
    
    init(soundLevels: SoundLevels) {
        self.soundLevels = soundLevels
        
    }
    
    
}
