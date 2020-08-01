//
//  ShowHealthTableViewCell.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit

class ShowHealthTableViewCell: UITableViewCell {
    
    @IBOutlet weak var showAllHealtBtn: UIButton!
        
    var showFullDataHandler: (() -> ())? = nil

    @IBAction func showAllHealthDataBtn(_ sender: UIButton) {
        showFullDataHandler?()
    }
    

}
