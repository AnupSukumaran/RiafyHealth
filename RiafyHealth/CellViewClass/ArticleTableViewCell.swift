//
//  ArticleTableViewCell.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var viewbase: UIView!
    @IBOutlet weak var viewImgBase: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var lbArticleSubTitle: UILabel!
    
    var articlesArr = [Articles]()
    var cellIndex = 0
   var cellModel: CellConfigModel? {
        didSet {
            guard let cellMod = cellModel as? ArticlesCellModel else {return}
            articlesArr = cellMod.articles
            article = articlesArr[cellIndex]
        }
    }
    
    var article: Articles? {
        didSet{
            guard let art = article else {return}
            callImage(urlStr: art.image ?? "", imgView: imgView)
            articleTitle.text = art.heading ?? "-"
            lbArticleSubTitle.text = art.subheading ?? "-"
        }
    }

}
