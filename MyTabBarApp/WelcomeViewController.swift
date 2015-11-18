//
//  WelcomeViewController.swift
//  MyTabBarApp
//
//  Created by teklabsco on 11/16/15.
//  Copyright © 2015 Teklabs, LLC. All rights reserved.
//

import UIKit

var appIntroStatus:String?
var welcomeView:WelcomeViewController?
var appIntroViewController:AppIntroViewController?

let kAppIntroStatus:String = "0"
let BLANK_STATUS:String = "(New Status)"

var user: PFObject?
var newUser: Bool?
var userIsNew: Bool?


class WelcomeViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        welcomeView = self
        loadAppSettings()
 
    }
    
    override func viewWillAppear(animated: Bool) {
        saveAppSettings()
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        if appIntroStatus == nil {
            saveAppSettings()
        }
        super.viewDidAppear(animated)
        print("Is showAppIntro set? ", kAppIntroStatus)
        user = PFUser.currentUser()
        
        
        if (user == nil) {
            let loginViewController = LoginViewController()
            loginViewController.delegate = self
            loginViewController.fields = [.UsernameAndPassword, .LogInButton, .PasswordForgotten, .SignUpButton, .Facebook, .Twitter]
            loginViewController.emailAsUsername = true
            loginViewController.signUpController?.emailAsUsername = true
            loginViewController.signUpController?.delegate = self
            print("In the login cue. ")
            self.presentViewController(loginViewController, animated: false, completion: nil)
        } else {
            proceedToSegue()

        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //tabBarViewController?.tabBarDescriptionLabel.editable = true
        

        
        if segue.identifier == "showIntroViewController" {
            print("Show Intro ")
        }
        else if segue.identifier == "showTabBarController" {
            print("Show Tab Bar ")
            let userObject = PFUser.currentUser()
            tabBarViewController?.currentUser = userObject
            //tabBarViewController?.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
            tabBarViewController?.navigationItem.leftItemsSupplementBackButton = true
        }
    }
    
    

    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
        //presentLoggedInAlert()
        appIntroStatus = "0"
        //self.performSegueWithIdentifier("showTabBarController", sender: self)
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
        //presentLoggedInAlert()
        userIsNew = true
        appIntroStatus = "1"
        self.performSegueWithIdentifier("showIntroViewController", sender: self)
    }
    
    func presentLoggedInAlert() {
        let alertController = UIAlertController(title: "You're logged in", message: "Welcome to MyTabBarApp", preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        alertController.addAction(OKAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        self.performSegueWithIdentifier("showIntroViewController", sender: self)
    }
    
    func proceedToSegue() {

        if ((appIntroStatus == "1") || (appIntroStatus == nil)) {
            print("Is this user new? ", PFUser.currentUser()!.isNew.boolValue)
            self.performSegueWithIdentifier("showIntroViewController", sender: self)
        }
        else if(appIntroStatus == "0") {
            self.performSegueWithIdentifier("showTabBarController", sender: self)
        }

    }
    
    func saveAppSettings() {
        if (appIntroStatus == nil){
            appIntroStatus = "0"
        }

        NSUserDefaults.standardUserDefaults().setObject(appIntroStatus, forKey: kAppIntroStatus)
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    

    func loadAppSettings() {
        if let loadedData = NSUserDefaults.standardUserDefaults().stringForKey(kAppIntroStatus)  {
            appIntroStatus = loadedData
        }
    }
        
}


