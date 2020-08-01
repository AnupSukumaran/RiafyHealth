//
//  SleepAnalysisTableViewCell.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 02/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit

class SleepAnalysisTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var iconImgView: UIImageView!
    @IBOutlet weak var mainTitleLB: UILabel!
    
    @IBOutlet weak var hrLB: UILabel!
    @IBOutlet weak var hrTitleLB: UILabel!
    
    @IBOutlet weak var minLB: UILabel!
    @IBOutlet weak var minTitleLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
