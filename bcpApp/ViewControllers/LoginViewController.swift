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
import AMPopTip

var UserName = ""
var UserPassword: String = ""
var existing = false


class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var questionButton: UIButton!
    let user = User()
    
    @IBAction func questionPressed(sender: AnyObject) {
        let popTip = AMPopTip()
        popTip.popoverColor = UIColor.blueColor()
        popTip.showText("Login is done to easily sign in to all of your school accounts at once. \n Don't worry, all passwords are encypted and stored locally!", direction: .Down, maxWidth: 200, inView: self.view, fromFrame: questionButton.frame)
        popTip.shouldDismissOnTap = true
        popTip.shouldDismissOnTapOutside = true
        popTip.shouldDismissOnSwipeOutside = true
        questionButton.enabled = false
        delay(5) {
            self.questionButton.enabled = true
        }
        
        
    }
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
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    
    @IBAction func loginPressed(sender: AnyObject) {
        
        if usernameLabel.text?.rangeOfString("@bcp.org") == nil && usernameLabel.text?.isEmpty == false && usernameLabel.text?.isEmpty == false {
            let banner = Banner(title: "Oops!", subtitle: "Please enter a valid Bellarmine email.", backgroundColor: UIColor.redColor())
            banner.dismissesOnTap = true
            banner.show(duration: 3.0)
            existing = false
        }
            
        else if usernameLabel.text?.isEmpty == true || passwordLabel.text?.isEmpty == true {
            let banner = Banner(title: "Oops!", subtitle: "Looks like you left something blank!", backgroundColor: UIColor.redColor())
            banner.dismissesOnTap = true
            banner.show(duration: 3.0)
        }
            
//        else if existing == true {
//            UserName = usernameLabel.text!
//            UserPassword = passwordLabel.text!
//            self.performSegueWithIdentifier("login", sender: self)
//        }
            
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