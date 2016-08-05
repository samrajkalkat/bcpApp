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

var UserName = ""
var UserPassword: String = ""

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
            }
        }
    }
    
    @IBAction func loginPressed(sender: AnyObject) {
        
        for realmUser in RealmHelper.getUser() {
            if realmUser.name == "" && realmUser.password == "" && passwordLabel.text != "" && usernameLabel.text != ""{
                user.password = passwordLabel.text!
                user.name = usernameLabel.text!
                RealmHelper.addUser(user)
                UserName = usernameLabel.text!
                UserPassword = passwordLabel.text!
                print("user created!")
            }
                
            
            else {
                print("nothing entered / existing")
                
            }
        }
        
    
    }
}