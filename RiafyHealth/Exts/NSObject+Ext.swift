//
//  NSObject+Ext.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation
import UIKit

extension NSObject {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func callImage(urlStr: String, imgView: UIImageView) {
        if let iconImgURL = URL(string: urlStr) {
            imgView.sd_setImage(with: iconImgURL, placeholderImage: nil, options: .highPriority) { (img, err, cache, url) in
                guard err == nil else {return}
                
            }
        }
    }
    
}
