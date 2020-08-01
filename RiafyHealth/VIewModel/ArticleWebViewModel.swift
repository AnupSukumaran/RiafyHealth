//
//  ArticleWebViewModel.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit

class ArticleWebViewModel: NSObject {

    var viewHeight: CGFloat = 0
    
    override init() {}
    
}

extension ArticleWebViewModel: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ArticleWebViewTableViewCell.identifier, for: indexPath) as? ArticleWebViewTableViewCell {
            return cell
        }
        return UITableViewCell()
    }
    
    
}
