//
//  ActivityCellModel.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation

class ActivityCellModel: CellConfigModel {
    
    var celltype: CellType {
        return .activity
    }
    
    var rowCount: Int {
        return 1
    }
    
    let activity: Activity
    
    init(activity: Activity) {
        self.activity = activity
        
    }
    
    
}
