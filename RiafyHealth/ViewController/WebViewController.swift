//
//  WebViewController.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 02/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var doneBtn: UIButton!
    
    var webView: WKWebView!
    var urlString = "https://www.apple.com"
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        
        view = webView
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "search", withExtension: "html")!
        webView.loadFileURL(url, allowingReadAccessTo: url)
        let request = URLRequest(url: url)
        webView.load(request)
        
//        let myURL = URL(string: urlString)
//               var req = URLRequest(url: myURL!)
//               req.cachePolicy = .returnCacheDataElseLoad
//               webView.load(req)
    }
    
    @IBAction func doneBtnAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension WebViewController: WKUIDelegate, WKNavigationDelegate {
    
    
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    
    
    
   
    
}
