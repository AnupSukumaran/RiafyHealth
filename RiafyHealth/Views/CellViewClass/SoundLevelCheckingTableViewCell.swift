//
//  SoundLevelCheckingTableViewCell.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 02/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit
import AVFoundation
import CoreAudio

class SoundLevelCheckingTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImgView: UIImageView!
    @IBOutlet weak var soundLevelTitleLB: UILabel!
    @IBOutlet weak var soundCheckImgView: UIImageView!
    @IBOutlet weak var soundOkLB: UILabel!
    @IBOutlet weak var exposureLB: UILabel!
    
    var soundLevels: SoundLevels!
    var currentSoundLevel: Int = 0
    var LEVEL_THRESHOLD: Float = 10
    var newSoundValue: Float = 0
    
    var recorder: AVAudioRecorder!
    var levelTimer = Timer()

    
    
    var cellModel: CellConfigModel? {
       didSet {
           guard let cellMod = cellModel as? EnvironmentCellModel else {return}
          soundLevels = cellMod.soundLevels
           callImage(urlStr: soundLevels.icon ?? "", imgView: iconImgView)
            soundLevelTitleLB.text = soundLevels.name ?? "-"
        
        if let sLevel = soundLevels.value {
            LEVEL_THRESHOLD = Float(sLevel)

        }
            
        
       }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        soundDecibelCheck()
    }
    
    

    
    func soundDecibelCheck() {
        let documents = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0])
        let url = documents.appendingPathComponent("record.caf")
        let recordSettings: [String: Any] = [
           AVFormatIDKey:              kAudioFormatAppleIMA4,
           AVSampleRateKey:            44100.0,
           AVNumberOfChannelsKey:      2,
           AVEncoderBitRateKey:        12800,
           AVLinearPCMBitDepthKey:     16,
           AVEncoderAudioQualityKey:   AVAudioQuality.max.rawValue
        ]
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
           try audioSession.setCategory(AVAudioSession.Category.playAndRecord)
           try audioSession.setActive(true)
           try recorder = AVAudioRecorder(url:url, settings: recordSettings)

        } catch {
           return
        }
        
        recorder.prepareToRecord()
        recorder.isMeteringEnabled = true
        
        recorder.record()
        
        levelTimer.invalidate()
        levelTimer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(levelTimerCallback), userInfo: nil, repeats: true)
    }
    
    @objc func levelTimerCallback() {
        recorder.updateMeters()
       
        let level = recorder.averagePower(forChannel: 0)
        let result = pow(10.0, level / 20.0) * 120.0
       
        let isLoud = result > LEVEL_THRESHOLD
        print("JJK1LEVEL_THRESHOLD = \(LEVEL_THRESHOLD)")
        print("JJK2result = \(result)")
        print("JJK3isLoud = \(isLoud)")
        
        if isLoud {
            soundCheckImgView.image = #imageLiteral(resourceName: "errorImg")
             //callImage(urlStr: soundLevels.iconError ?? "", imgView: soundCheckImgView)
        } else {
            soundCheckImgView.image = #imageLiteral(resourceName: "tick")
            // callImage(urlStr: soundLevels.iconOK ?? "", imgView: soundCheckImgView)
        }

    }
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        iconImgView = nil
        soundCheckImgView = nil
        
    }

}
