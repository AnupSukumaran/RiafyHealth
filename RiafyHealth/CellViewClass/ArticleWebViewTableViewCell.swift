//
//  ArticleWebViewTableViewCell.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit
import WebKit

class ArticleWebViewTableViewCell: UITableViewCell {

    @IBOutlet weak var viewBase: UIView!
    
    var webView: WKWebView!
    var urlString = "https://www.apple.com"
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        
       
        
    }
    
    func config() {
        
        
        webView.frame = viewBase.frame
        layoutIfNeeded()
        //viewBase = webView
        viewBase.addSubview(webView)
        
        let myURL = URL(string: urlString)
        let req = URLRequest(url: myURL!)
               //req.cachePolicy = .returnCacheDataElseLoad
       
               webView.load(req)
       
    }
    
 
    
    override func layoutSubviews() {
         webView.frame = viewBase.frame
        // let webConfiguration = WKWebViewConfiguration()
              // webView = WKWebView(frame: viewBase.frame, configuration: webConfiguration)
               
                   //webView.allowsBackForwardNavigationGestures = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
