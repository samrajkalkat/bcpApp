//
//  LoginViewController.swift
//  bcpApp
//
//  Created by samraj on 8/1/16.
//  Copyright © 2016 Samraj. All rights reserved.
//

import Foundation
import UIKit

var UserName = ""
var UserPassword: String = ""

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UITextField!

    @IBOutlet weak var passwordLabel: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func loginPressed(sender: AnyObject) {
        if usernameLabel.text != "" && passwordLabel.text != "" {
           
            UserName = usernameLabel.text!
            UserPassword = passwordLabel.text!
        }
        else {
            print("nothing entered")
        }
        
    }
    

}