//
//  ViewController.swift
//  FirstViewController
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var homeListView: UITableView!
    
  
    
    var articleWebViewModel: ArticleWebViewModel!
    
    var homeViewModel: HomeViewModel! {
        didSet {
            setHandlersForHomeViewModel()
        }
    }
    
    var healthDataViewModel: HealthDataViewModel! {
        didSet {
            setHandlersForHealthDataViewModel()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewModels()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let healthData = healthDataViewModel {
             healthData.levelTimer.invalidate()
        }
       
    }
       
    
    func setUpViewModels() {
        
        if let homeView = homeViewModel {
            
            homeListView.delegate = homeView
            homeListView.dataSource = homeView
            homeListView.estimatedRowHeight = 54
            
        }
        
        if let healthData = healthDataViewModel {
            homeListView.delegate = healthData
            homeListView.dataSource = healthData
            homeListView.estimatedRowHeight = 100
            
            navigationItem.title = "All Health Data"
    
        }
        
        
        
        homeListView.rowHeight = UITableView.automaticDimension
    }
    
    
    func setHandlersForHealthDataViewModel() {
        healthDataViewModel.tableReloadHandler = { [weak self] in
            guard let vc = self else {return}
            vc.homeListView.reloadData()
        }
        
        
    }

    
    func setHandlersForHomeViewModel() {
        homeViewModel.tableReloadHandler = { [weak self] in
            guard let vc = self else {return}
            vc.homeListView.reloadData()
        }
        
        homeViewModel.showFullDataHandler = { [weak self] in
            guard let vc = self else {return}
            vc.callFirstViewController()
        }
        
        homeViewModel.selectedTheArticleHandler = { [weak self] in
            guard let vc = self else {return}
            vc.callWebViewConroller()
        }
    }
    
    
    
    

}

