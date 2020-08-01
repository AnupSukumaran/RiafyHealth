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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
