//
//  ActivityTableViewCell.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var stackView1: UIStackView!
    @IBOutlet weak var stackView2: UIStackView!
    @IBOutlet weak var stackView3: UIStackView!
    @IBOutlet weak var iconImgView: UIImageView!
    @IBOutlet weak var cellTitleLB: UILabel!
    @IBOutlet weak var timeLB: UILabel!
    @IBOutlet weak var stackView4: UIStackView!
    @IBOutlet weak var stackView5: UIStackView!
    @IBOutlet weak var stackView6: UIStackView!
    @IBOutlet weak var moveTitle: UILabel!
    @IBOutlet weak var stackView7: UIStackView!
    @IBOutlet weak var lbCalories: UILabel!
    @IBOutlet weak var lbCalTitle: UILabel!
    @IBOutlet weak var viewDivider1: UIView!
    @IBOutlet weak var stackView8: UIStackView!
    @IBOutlet weak var stackView9: UIStackView!
    @IBOutlet weak var lbExercise: UILabel!
    @IBOutlet weak var stackView10: UIStackView!
    @IBOutlet weak var lbMinuteData: UILabel!
    @IBOutlet weak var lbMinuteTitle: UILabel!
    @IBOutlet weak var viewDivider2: UIView!
    @IBOutlet weak var stackView11: UIStackView!
    @IBOutlet weak var stackView12: UIStackView!
    @IBOutlet weak var lbStand: UILabel!
    @IBOutlet weak var stackView13: UIStackView!
    @IBOutlet weak var lbStandTimeData: UILabel!
    @IBOutlet weak var lbStandhrTitle: UILabel!
    @IBOutlet weak var viewDivider3: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
