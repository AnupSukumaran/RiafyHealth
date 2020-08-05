//
//  WebViewController.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 02/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit
import WebKit
import StoreKit

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
        
    }
    
    func shareButtonClicked(urlString: String) {
    
        let message = "Share this App"
       
        if let link = NSURL(string: urlString)
        {
            let objectsToShare = [message,link] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    func writeAppReviewFunc() {
        let productURL = URL(string: "https://itunes.apple.com/us/app/rwdevcon-conference/id958625272?mt=8")!
        var components = URLComponents(url: productURL, resolvingAgainstBaseURL: false)
        components?.queryItems = [
          URLQueryItem(name: "action", value: "write-review")
        ]
        
        guard let writeReviewURL = components?.url else {return}
        UIApplication.shared.open(writeReviewURL)
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
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
       
       guard let urlAsString = navigationAction.request.url?.absoluteString.lowercased() else {return}
        print("urlAsString = \(urlAsString)")
       let ulrD = URL(string: urlAsString)
        
        if urlAsString == "https://stories.riafy.me/" {
            decisionHandler(.cancel)
            return
        }
        
        if ulrD!.lastPathComponent == "sharetheapp" {
            shareButtonClicked(urlString: urlAsString)
        }
        

        if ulrD!.lastPathComponent == "ratetheapp" {
            self.writeAppReviewFunc()
        }
        
     
        decisionHandler(.allow)
    
    }
    
}
