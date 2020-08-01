//
//  UIStoryboard+Ext.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit

extension UIStoryboard {
    static func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func firstViewController() -> FirstViewController? {
        return mainStoryboard().instantiateViewController(withIdentifier: FirstViewController.identifier) as? FirstViewController
    }
}
