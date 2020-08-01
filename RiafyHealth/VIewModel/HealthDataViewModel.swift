//
//  HealthDataViewModel.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit

class HealthDataViewModel: NSObject {
    
    var healthDataModel: HealthDataModel? = nil
    var tableReloadHandler: (() -> ())? = nil
    var cellModels = [CellConfigModel]()

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
  
    }
    
    
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
