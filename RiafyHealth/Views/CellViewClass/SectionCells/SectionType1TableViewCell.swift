//
//  SectionType1TableViewCell.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit

class SectionType1TableViewCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    
    var cellModel: CellConfigModel? {
       didSet {
           guard let cellMod = cellModel as? FavouriteHeaderCellModel else {return}
           lbTitle.text = cellMod.title
       }
    }

}
