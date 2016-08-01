//
//  GradebookViewController.swift
//  bcpApp
//
//  Created by samraj on 8/1/16.
//  Copyright © 2016 Samraj. All rights reserved.
//

import Foundation
import UIKit

class GradbookViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        let myUrl = NSURL(string: "https://powerschool.bcp.org/public/home.html")
        webView.scalesPageToFit = true;
        webView.hidden = false
        let urlRequest = NSURLRequest(URL: myUrl!)
        webView.loadRequest(urlRequest)
        self.webView.frame = self.view.bounds
        self.webView.scalesPageToFit = true
        self.view.addSubview(webView)
        
       
    }
    
}
