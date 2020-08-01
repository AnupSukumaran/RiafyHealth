//
//  SleepAnalysisCellModel.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 02/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation

class SleepAnalysisCellModel: CellConfigModel {
    
    var celltype: CellType {
        return .sleepAnalysis
    }
    
    var rowCount: Int {
        return 1
    }
    
    let sleepHours: SleepHours
    
    init(sleepHours: SleepHours) {
        self.sleepHours = sleepHours
        
    }
    
    
}
