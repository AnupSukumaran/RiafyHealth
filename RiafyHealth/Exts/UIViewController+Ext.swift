//
//  UIViewController+Ext.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func nav(_ vc: UIViewController, present:  UIModalPresentationStyle = .fullScreen) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = present
        return nav
    }
    
    
    func callFirstViewController() {
        guard let vc = UIStoryboard.firstViewController() else {return}
        vc.articleWebViewModel = ArticleWebViewModel()
        present(nav(vc, present: .formSheet), animated: true, completion: nil)
    }
}
