//
//  EmailViewController.swift
//  bcpApp
//
//  Created by samraj on 8/1/16.
//  Copyright © 2016 Samraj. All rights reserved.
//

import Foundation
import UIKit

class EmailViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet var emailView: UIView!

    @IBOutlet weak var emailWebView: UIWebView!
    
    override func viewDidLoad() {
        let myUrl = NSURL(string: "https://outlook.com/owa/bcp.org")
        emailWebView.scalesPageToFit = true;
        let urlRequest = NSURLRequest(URL: myUrl!)
        emailWebView.delegate = self
        emailWebView.loadRequest(urlRequest)
        self.emailWebView.frame = self.view.bounds
        self.emailWebView.scalesPageToFit = true
        self.view.addSubview(emailWebView)
        if isViewLoaded() {
              webViewDidFinishLoad(emailWebView)
        }
        emailWebView.scrollView.scrollEnabled = false
        
     
        var upSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        var downSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        
        upSwipe.direction = .Up
        downSwipe.direction = .Down
        
        emailView.addGestureRecognizer(upSwipe)
        emailView.addGestureRecognizer(downSwipe)
        
        emailWebView.scrollView.panGestureRecognizer.requireGestureRecognizerToFail(upSwipe)
        emailWebView.scrollView.panGestureRecognizer.requireGestureRecognizerToFail(downSwipe)
        
        
 
    }
    
    
    
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Up) {
            print("Swipe Up")
            self.tabBarController?.tabBar.hidden = true
        }
        
        if (sender.direction == .Down) {
            print("Swipe Down")
            self.tabBarController?.tabBar.hidden = false
            
        }
    }

  
    
    func webViewDidFinishLoad(webView: UIWebView) {

        
        // fill data
        let savedUsername = UserName
        let savedPassword = UserPassword
        
        
        let fillForm = String(format: "document.getElementById('username').value = '\(UserName)'; document.getElementById('password').value = '\(UserPassword)';")
        webView.stringByEvaluatingJavaScriptFromString(fillForm)
        
        let submitForm = String(format: "document.forms[0].submit();")
        


    }
  
    
}
