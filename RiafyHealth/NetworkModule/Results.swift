//
//  Results.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation

public enum Results<T> {
    case success(T)
    case failure(errorStr: String, model:T? = nil)
}

