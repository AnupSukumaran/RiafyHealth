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
    
    var homeViewModel: HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHomeListView()
    }
    
    func setUpHomeListView() {
        homeListView.delegate = homeViewModel
        homeListView.dataSource = homeViewModel
        homeListView.estimatedRowHeight = 54
        homeListView.rowHeight = UITableView.automaticDimension
    }


}

