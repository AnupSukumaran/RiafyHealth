//
//  SoundLevelCheckingTableViewCell.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 02/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit

class SoundLevelCheckingTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImgView: UIImageView!
    @IBOutlet weak var soundLevelTitleLB: UILabel!
    @IBOutlet weak var soundCheckImgView: UIImageView!
    @IBOutlet weak var soundOkLB: UILabel!
    @IBOutlet weak var exposureLB: UILabel!
    
    var currentSoundLevel: Int = 0
    
    var cellModel: CellConfigModel? {
       didSet {
           guard let cellMod = cellModel as? EnvironmentCellModel else {return}
            let soundLevels = cellMod.soundLevels
           callImage(urlStr: soundLevels.icon ?? "", imgView: iconImgView)
            soundLevelTitleLB.text = soundLevels.name ?? "-"
        
        if let sLevel = soundLevels.value {
            
            if currentSoundLevel < sLevel {
                 callImage(urlStr: soundLevels.iconOK ?? "", imgView: soundCheckImgView)
            } else {
                 callImage(urlStr: soundLevels.iconError ?? "", imgView: soundCheckImgView)
            }
            
        }
            
        
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
