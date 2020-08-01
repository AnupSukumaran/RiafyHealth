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
    
    override init() {
        super.init()
        callHomeAPI()
    }
    
    func callHomeAPI() {
        APILibrary.shared.apiGetHome { (response) in
            switch response {
            case.success(let data):
                let homeData = data.homeModel
                
                
            case .failure(errorStr: let errStr, model: _):
                print("errStr = \(errStr)")
                
            }
        }
    }

}


extension HomeViewModel: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
