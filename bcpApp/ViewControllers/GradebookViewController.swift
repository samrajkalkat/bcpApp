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
   
    
    
    @IBAction func powerschoolPressed(sender: AnyObject) {
        let webVC = SwiftModalWebVC(urlString: "https://powerschool.bcp.org/student/idp")
        self.presentViewController(webVC, animated: true, completion: nil)
    }
    
    @IBAction func naviancePressed(sender: AnyObject) {
        let webVC = SwiftModalWebVC(urlString: "https://connection.naviance.com/family-connection/auth/login/?hsid=bellarmine")
        self.presentViewController(webVC, animated: true, completion: nil)
    }
    @IBAction func canvasPressed(sender: AnyObject) {
        let webVC = SwiftModalWebVC(urlString: "https://federation.bcp.org/idp/SSO.saml2?SAMLRequest=nZJfa4MwFMXf9ykk79WYrbYGFbqWsUK3Sev2sLcYr21AE5fE%2Ffn2i3aDQuke9hS4OTnnx7lJDGubji56e5BbeOvBWO%2BzbaSh40WKei2pYkYYKlkLhlpOd4uHDSU%2Bpp1WVnHVIG%2B9SlEV1jwmvKwIwfMoBoYZrglMKxLBlNd1eT3D1SyOpzHyXkAboWSKnI17bUwPa2ksk9aNcBhN8HyC44KEFM%2FpTfSKvPwn61bISsj932DlUWTofVHkk%2FxpVyBvYQxo60KXSpq%2BBb0D%2FS44PG83KTpY2xkaBCXvfOFAdM9tr8Hnqg0atRcyGOpAWTIcdOTVJz39TcN%2Bk1E25FyIGXxIEpwEZFfJcTuPznK9ylUj%2BNd%2FtnOndMvsZXXoh%2BNEVJN6lNJemg64qAVUrrmmUR9LDcxCihwzuB6CczKHG5z%2Fpuwb")

        self.presentViewController(webVC, animated: true, completion: nil)
    }
    
    
    
 
    
    @IBOutlet weak var canvasButton: UIButton!
    @IBOutlet weak var navianceButton: UIButton!
    @IBOutlet weak var powerschoolButton: UIButton!
    override func viewDidLoad() {
        
        canvasButton.layer.cornerRadius = 15
        canvasButton.layer.borderWidth = 1
        canvasButton.layer.borderColor = UIColor(red:0.04, green:0.38, blue:0.80, alpha:1.0).CGColor
        
        navianceButton.layer.cornerRadius = 15
        navianceButton.layer.borderWidth = 1
        navianceButton.layer.borderColor = UIColor(red:0.04, green:0.38, blue:0.80, alpha:1.0).CGColor
        
        powerschoolButton.layer.cornerRadius = 15
        powerschoolButton.layer.borderWidth = 1
        powerschoolButton.layer.borderColor = UIColor(red:0.04, green:0.38, blue:0.80, alpha:1.0).CGColor
    }
}

func webViewDidFinishLoad(webView: UIWebView) {
    
    
    // fill data
//            let savedUsername = UserName
//            let savedPassword = UserPassword
//    
//
//            let fillForm = String(format: "document.getElementById('username').value = '\(savedUsername)'; document.getElementById('password').value = '\(savedPassword)';")
//    
//            webVC.stringByEvaluatingJavaScriptFromString(fillForm)
    
}


