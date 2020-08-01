//
//  HealthDataViewModel.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit
import AVFoundation
import CoreAudio

class HealthDataViewModel: NSObject {
    
    var healthDataModel: HealthDataModel? = nil
    var tableReloadHandler: (() -> ())? = nil
    var cellModels = [CellConfigModel]()
    var levelTimer = Timer()
    
//    var recorder: AVAudioRecorder!
//    var levelTimer = Timer()
//    var LEVEL_THRESHOLD: Float = 0
//    
    override init() {
        super.init()
        callHealthDataAPI()
    }
    
    func callHealthDataAPI() {
        APILibrary.shared.apiGetHealthDataAPI { (response) in
            switch response {
            case.success(let data):
                self.healthDataModel = data.healthDataModel
                self.addCellModels()
                self.tableReloadHandler?()
               // self.soundDecibelCheck()
                
            case .failure(errorStr: let errStr, model: _):
                print("errStr = \(errStr)")
                
            }
        }
    }
    
    func addCellModels() {
        cellModels.removeAll()
        guard let cellMod = healthDataModel else {return}
        
        if let standHours = cellMod.standHours {
            let stepsModel = StepsCellModel(steps: standHours)
            cellModels.append(stepsModel)
            
        }
        
        if let activeEnergy = cellMod.activeEnergy {
            let stepsModel = StepsCellModel(steps: activeEnergy)
            cellModels.append(stepsModel)
            
        }
        
        if let soundLevels = cellMod.soundLevels {
            let soundL = EnvironmentCellModel(soundLevels: soundLevels)// StepsCellModel(steps: activeEnergy)
            cellModels.append(soundL)
            
        }
        
        if let sleepHours = cellMod.sleepHours {
            let sleepHr = SleepAnalysisCellModel(sleepHours: sleepHours)
            cellModels.append(sleepHr)
            
        }
        
  
    }
    
//    func soundDecibelCheck() {
//        let documents = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0])
//        let url = documents.appendingPathComponent("record.caf")
//        let recordSettings: [String: Any] = [
//           AVFormatIDKey:              kAudioFormatAppleIMA4,
//           AVSampleRateKey:            44100.0,
//           AVNumberOfChannelsKey:      2,
//           AVEncoderBitRateKey:        12800,
//           AVLinearPCMBitDepthKey:     16,
//           AVEncoderAudioQualityKey:   AVAudioQuality.max.rawValue
//        ]
//
//        let audioSession = AVAudioSession.sharedInstance()
//        do {
//           try audioSession.setCategory(AVAudioSession.Category.playAndRecord)
//           try audioSession.setActive(true)
//           try recorder = AVAudioRecorder(url:url, settings: recordSettings)
//
//        } catch {
//           return
//        }
//
//        recorder.prepareToRecord()
//        recorder.isMeteringEnabled = true
//
//        recorder.record()
//
//        levelTimer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(levelTimerCallback), userInfo: nil, repeats: true)
//    }
//
//    @objc func levelTimerCallback() {
//        recorder.updateMeters()
//
//        let level = recorder.averagePower(forChannel: 0)
//        let result = pow(10.0, level / 20.0) * 120.0
//
//        let isLoud = result > LEVEL_THRESHOLD
//        print("JJK1LEVEL_THRESHOLD = \(LEVEL_THRESHOLD)")
//        print("JJK2result = \(result)")
//        print("JJK3isLoud = \(isLoud)")
//
//    }
    
    
    
    func newCellTypeBasedOnCellModel(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, cellModel: CellConfigModel) -> UITableViewCell {
        
        var cellClass = UITableViewCell()
        
        switch cellModel.celltype {
            
        case .activity:
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: ActivityTableViewCell.identifier, for: indexPath) as? ActivityTableViewCell {
                cell.cellModel = cellModel
                cellClass = cell
            }
            
        case .steps:
            if let cell = tableView.dequeueReusableCell(withIdentifier: StepsTableViewCell.identifier, for: indexPath) as? StepsTableViewCell {
                cell.cellModelForHealthData = cellModel
                cellClass = cell
            }
            
        case .articles:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier, for: indexPath) as? ArticleTableViewCell {
                cell.cellIndex = indexPath.row
                cell.cellModel = cellModel
                cellClass = cell
            }
            
        case .showAllData:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ShowHealthTableViewCell.identifier, for: indexPath) as? ShowHealthTableViewCell {
                cellClass = cell
            }
            
        case .sleepAnalysis:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SleepAnalysisTableViewCell.identifier, for: indexPath) as? SleepAnalysisTableViewCell {
                cell.cellModel = cellModel
                cellClass = cell
            }
        
        case .soundLevel:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SoundLevelCheckingTableViewCell.identifier, for: indexPath) as? SoundLevelCheckingTableViewCell {
                 cell.cellModel = cellModel
                levelTimer = cell.levelTimer
               //  LEVEL_THRESHOLD = cell.LEVEL_THRESHOLD
                cellClass = cell
            }
        
        }
        
        return cellClass
        
    }
    
    func returnSectionHeight(_ section: Int)  -> CGFloat {
        if section == 0 {
           return 54
        } else {
           return 0
        }

    }

    func getSectionCells(_ tableView: UITableView, _ section: Int) -> UIView {
        if section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: SectionType2TableViewCell.identifier) as? SectionType2TableViewCell {
                cell.sectionTitle.text = "Today"
                return cell.contentView
            }
        }

        return UIView()
    }
    
    deinit {
        
    }
    
    
}

extension HealthDataViewModel: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return cellModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return cellRowCountBasedOnCellModel(cellModel: cellModels[section])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return newCellTypeBasedOnCellModel(tableView, cellForRowAt: indexPath, cellModel: cellModels[indexPath.section])
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return getSectionCells(tableView, section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return returnSectionHeight( section)
    }
    
    
}
