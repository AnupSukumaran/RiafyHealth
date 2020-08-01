//
//  ArticlesCellModel.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation

class ArticlesCellModel: CellConfigModel {
    
    var celltype: CellType {
        return .articles
    }
    
    let articles: [Articles]
    
    var rowCount: Int {
        return articles.count
    }
        
    init(articles: [Articles]) {
        self.articles = articles
       
    }
    
    
}
