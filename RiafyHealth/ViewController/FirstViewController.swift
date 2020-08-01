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
    
    @IBOutlet weak var doneBtn: UIButton!
    
    var articleWebViewModel: ArticleWebViewModel!
    
    var homeViewModel: HomeViewModel! {
        didSet {
            setHandlersForHomeViewModel()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewModels()
        
    }
    
    func setUpViewModels() {
        if let artview = articleWebViewModel {
            artview.viewHeight = homeListView.frame.height
            homeListView.delegate = artview
            homeListView.dataSource = artview
            homeListView.estimatedRowHeight = 100
             doneBtn.isHidden = false
            navigationItem.title = "Article"
    
        }
        
        if let homeView = homeViewModel {
            
            homeListView.delegate = homeView
            homeListView.dataSource = homeView
            homeListView.estimatedRowHeight = 54
            doneBtn.isHidden = true
        }
        
        homeListView.rowHeight = UITableView.automaticDimension
    }
    

    
    func setHandlersForHomeViewModel() {
        homeViewModel.tableReloadHandler = { [weak self] in
            guard let vc = self else {return}
            vc.homeListView.reloadData()
        }
        
        homeViewModel.showFullDataHandler = { [weak self] in
            guard let vc = self else {return}
            
        }
        
        homeViewModel.selectedTheArticleHandler = { [weak self] in
            guard let vc = self else {return}
            vc.callWebViewConroller()
        }
    }
    
    
    @IBAction func doneAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}

