//
//  NSObject+Ext.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation

extension NSObject {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
