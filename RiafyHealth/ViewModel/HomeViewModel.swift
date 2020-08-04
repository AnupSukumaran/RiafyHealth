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
    var showFullDataHandler: (() -> ())? = nil
    var selectedTheArticleHandler: (() -> ())? = nil
    
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
        cellModels.append(FavouriteHeaderCellModel(title: "Favourites"))
        if let activity = cellMod.activity {
            let actModel = ActivityCellModel(activity: activity)
            cellModels.append(actModel)
        }
        
        if let steps = cellMod.steps {
            let stepsModel = StepsCellModel(steps: steps)
            cellModels.append(stepsModel)
            
        }
        
        cellModels.append(ShowFullDataCellModel())
        cellModels.append(GetMoreHealthHeaderCell(title: "Get More From Health"))
        
        if let articles = cellMod.articles {
            let articlesModel = ArticlesCellModel(articles: articles)
            cellModels.append(articlesModel)
        }
        
        
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
        return cellTypeBasedOnCellModel(tableView, cellForRowAt: indexPath, cellModel: cellModels[indexPath.section], showFullDataHandler: showFullDataHandler)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectTheArticleIndexOnly(cellModel: cellModels[indexPath.section], hander: selectedTheArticleHandler)
    }

}
