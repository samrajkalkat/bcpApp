//
//  GradebookViewController.swift
//  bcpApp
//
//  Created by samraj on 8/1/16.
//  Copyright © 2016 Samraj. All rights reserved.
//

import Foundation
import UIKit

class GradbookViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        let myUrl = NSURL(string: "https://powerschool.bcp.org/student/idp")
        webView.scalesPageToFit = true;
        webView.hidden = false
        let urlRequest = NSURLRequest(URL: myUrl!)
        webView.delegate = self
        webView.loadRequest(urlRequest)
        self.webView.frame = self.view.bounds
        self.webView.scalesPageToFit = true
        self.view.addSubview(webView)
        if isViewLoaded() {
            webViewDidFinishLoad(webView)
        }
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        
        // fill data
        let savedUsername = UserName
        let savedPassword = UserPassword
        
        
        let fillForm = String(format: "document.getElementById('username').value = '\(savedUsername)'; document.getElementById('password').value = '\(savedPassword)';")
        
        

        
        
    }
    
    

    
}
