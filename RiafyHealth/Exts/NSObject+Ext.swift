//
//  NSObject+Ext.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation
import UIKit

extension NSObject {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func callImage(urlStr: String, imgView: UIImageView, handler: ((_ img: UIImage) -> ())? = nil) {
        if let iconImgURL = URL(string: urlStr) {
            imgView.sd_setImage(with: iconImgURL, placeholderImage: nil, options: .highPriority) { (img, err, cache, url) in
                
                
                guard err == nil else {
                    
                    return}
                
                
                handler?(img!)
            }
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
        
        case .showAllData:
            cellCount = cellModel.rowCount
            
        case .sleepAnalysis:
            cellCount = cellModel.rowCount
            
        case .soundLevel:
            cellCount = cellModel.rowCount
            
        case .favHeader:
            cellCount = cellModel.rowCount
        
        case .getMorehealth:
            cellCount = cellModel.rowCount
        }
        
        return cellCount
    }
    
    func cellTypeBasedOnCellModel(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, cellModel: CellConfigModel, showFullDataHandler: (() -> ())? = nil) -> UITableViewCell {
        
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
            
        case .showAllData:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ShowHealthTableViewCell.identifier, for: indexPath) as? ShowHealthTableViewCell {
                cell.showFullDataHandler = showFullDataHandler
                cellClass = cell
            }
            
        case .favHeader:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SectionType2TableViewCell.identifier, for: indexPath) as? SectionType2TableViewCell {
                 cell.cellModel = cellModel
                cellClass = cell
            }
            
        case .getMorehealth:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SectionType1TableViewCell.identifier, for: indexPath) as? SectionType1TableViewCell {
                 cell.cellModel = cellModel
                cellClass = cell
            }
            
        default:
            break   
        
        }
        
        return cellClass
        
    }
    
    
    func selectTheArticleIndexOnly(cellModel: CellConfigModel, hander: (() -> ())?) {

        if cellModel.celltype == .articles {
            hander?()
        }

    }
}
