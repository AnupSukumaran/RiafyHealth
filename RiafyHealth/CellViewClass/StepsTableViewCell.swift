//
//  StepsTableViewCell.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit

class StepsTableViewCell: UITableViewCell {

    @IBOutlet weak var viewBase: UIView!
    @IBOutlet weak var stackView1: UIStackView!
    @IBOutlet weak var stackView2: UIStackView!
    @IBOutlet weak var stackView3: UIStackView!
    
    @IBOutlet weak var iconImgView: UIImageView!
    @IBOutlet weak var lbStepsMainTitle: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbStepsData: UILabel!
    @IBOutlet weak var lbStepsTitle: UILabel!
    
    var cellModel: CellConfigModel? {
        didSet {
            guard let cellMod = cellModel as? StepsCellModel else {return}
            let stepsModel = cellMod.steps
            
            callImage(urlStr: stepsModel.icon ?? "", imgView: iconImgView)
            lbStepsMainTitle.text = stepsModel.name ?? "-"
            lbStepsData.text = String(stepsModel.value ?? 0)
            
        }
    }
    
    var cellModelForHealthData: CellConfigModel? {
       didSet {
           guard let cellMod = cellModelForHealthData as? StepsCellModel else {return}
        
           let stepsModel = cellMod.steps
           
           callImage(urlStr: stepsModel.icon ?? "", imgView: iconImgView)
           lbStepsMainTitle.text = stepsModel.name ?? "-"
           lbStepsData.text = String(stepsModel.value ?? 0)
        lbStepsTitle.text = (stepsModel.name ?? "-") == "Stand hours" ? "hr" : "kcal"
           
       }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
