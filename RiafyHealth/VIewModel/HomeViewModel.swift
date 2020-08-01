//
//  HomeViewModel.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit

class HomeViewModel: NSObject {
    
    var cellModels = [CellConfigModel]()
    var homeData: HomeModel?
    
    var tableReloadHandler: (() -> ())? = nil
    
    override init() {
        super.init()
        callHomeAPI()
    }
    
    func callHomeAPI() {
        APILibrary.shared.apiGetHome { (response) in
            switch response {
            case.success(let data):
                self.homeData = data.homeModel
                self.addCellModels()
                self.tableReloadHandler?()
                
            case .failure(errorStr: let errStr, model: _):
                print("errStr = \(errStr)")
                
            }
        }
    }
    
    func addCellModels() {
        cellModels.removeAll()
        guard let cellMod = homeData else {return}
        
        if let activity = cellMod.activity {
            let actModel = ActivityCellModel(activity: activity)
            cellModels.append(actModel)
        }
        
        if let steps = cellMod.steps {
            let stepsModel = StepsCellModel(steps: steps)
            cellModels.append(stepsModel)
        }
        
        if let articles = cellMod.articles {
            let articlesModel = ArticlesCellModel(articles: articles)
            cellModels.append(articlesModel)
        }
        
        
    }
    
    func cellRowCountBasedOnCellModel(cellModel: CellConfigModel) -> Int{
        
        var cellCount = 0

        
        switch cellModel.celltype {
            
        case .activity:
            cellCount = cellModel.rowCount
            
        case .steps:
            cellCount = cellModel.rowCount
            
        case .articles:
            cellCount = cellModel.rowCount
        
        }
        
        return cellCount
    }
    
    func cellTypeBasedOnCellModel(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, cellModel: CellConfigModel) -> UITableViewCell {
        
        var cellClass = UITableViewCell()
        
        switch cellModel.celltype {
            
        case .activity:
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: ActivityTableViewCell.identifier, for: indexPath) as? ActivityTableViewCell {
                cell.cellModel = cellModel
                cellClass = cell
            }
            
        case .steps:
            if let cell = tableView.dequeueReusableCell(withIdentifier: StepsTableViewCell.identifier, for: indexPath) as? StepsTableViewCell {
                cell.cellModel = cellModel
                cellClass = cell
            }
            
        case .articles:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier, for: indexPath) as? ArticleTableViewCell {
                cell.cellIndex = indexPath.row
                cell.cellModel = cellModel
                cellClass = cell
            }
        
        }
        
        return cellClass
        
    }

}


extension HomeViewModel: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return cellModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return cellRowCountBasedOnCellModel(cellModel: cellModels[section])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellTypeBasedOnCellModel(tableView, cellForRowAt: indexPath, cellModel: cellModels[indexPath.section])
    }
    
    
}
