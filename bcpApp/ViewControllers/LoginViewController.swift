//
//  LoginViewController.swift
//  bcpApp
//
//  Created by samraj on 8/1/16.
//  Copyright © 2016 Samraj. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import BRYXBanner

var UserName = ""
var UserPassword: String = ""
var existing = false

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    
    let user = User()
    
    override func viewDidLoad() {
        boxView.layer.cornerRadius = 15
        for realmUser in RealmHelper.getUser() {
            if realmUser.name != "" && realmUser.password != "" {
                usernameLabel.text = realmUser.name
                passwordLabel.text = realmUser.password
                print("existing user")
                existing = true
                
            }
        }
        
    }
    
    
    @IBAction func loginPressed(sender: AnyObject) {
        
        if usernameLabel.text?.rangeOfString("@bcp.org") == nil && usernameLabel.text?.isEmpty == false && usernameLabel.text?.isEmpty == false {
            let banner = Banner(title: "Oops!", subtitle: "Please enter a valid Bellarmine email.", backgroundColor: UIColor.redColor())
            banner.dismissesOnTap = true
            banner.show(duration: 3.0)
            existing = false
        }
        
        else if usernameLabel.text?.isEmpty == true || usernameLabel.text?.isEmpty == true {
            let banner = Banner(title: "Oops!", subtitle: "Looks like you left something blank!", backgroundColor: UIColor.redColor())
            banner.dismissesOnTap = true
            banner.show(duration: 3.0)
        }
        
        else if existing == true {
            UserName = usernameLabel.text!
            UserPassword = passwordLabel.text!
            self.performSegueWithIdentifier("login", sender: self)
        }
            
        else {
            if passwordLabel.text?.isEmpty == false && usernameLabel.text?.isEmpty == false {
                user.password = passwordLabel.text!
                user.name = usernameLabel.text!
                RealmHelper.addUser(user)
                UserName = usernameLabel.text!
                UserPassword = passwordLabel.text!
                print("user created!")
                self.performSegueWithIdentifier("login", sender: self)
            }
            
        }
        
    }
}