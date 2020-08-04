//
//  SectionType2TableViewCell.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit

class SectionType2TableViewCell: UITableViewCell {

    @IBOutlet weak var sectionTitle: UILabel!
    
    var cellModel: CellConfigModel? {
        didSet {
            guard let cellMod = cellModel as? FavouriteHeaderCellModel else {return}
            sectionTitle.text = cellMod.title
        }
    }
}
