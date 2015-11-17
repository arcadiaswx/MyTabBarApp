//
//  WelcomeViewController.swift
//  MyTabBarApp
//
//  Created by teklabsco on 11/16/15.
//  Copyright © 2015 Teklabs, LLC. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    
    var segueStatusID = "foo"
    //var showAppIntro: Bool?
    var showAppIntro: Bool?
    var user: PFObject?
    var newUser: Bool?
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("Is showAppIntro set? ", showAppIntro)
        user = PFUser.currentUser()
        
        if (user == nil) {
            let loginViewController = LoginViewController()
            loginViewController.delegate = self
            loginViewController.fields = [.UsernameAndPassword, .LogInButton, .PasswordForgotten, .SignUpButton, .Facebook, .Twitter]
            loginViewController.emailAsUsername = true
            loginViewController.signUpController?.emailAsUsername = true
            loginViewController.signUpController?.delegate = self
            self.presentViewController(loginViewController, animated: false, completion: nil)
        } else {
            //presentLoggedInAlert()
            if ((PFUser.currentUser()!.isNew.boolValue == true) || (showAppIntro!.boolValue == false)) {
                print("Is this user new? ", PFUser.currentUser()!.isNew.boolValue)
                self.performSegueWithIdentifier("showTabBarController", sender: self)
            }
            else if(showAppIntro!.boolValue == true) {
                self.performSegueWithIdentifier("showIntroViewController", sender: self)
            }
        }
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
        //presentLoggedInAlert()
        self.performSegueWithIdentifier("showTabBarController", sender: self)
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
        //presentLoggedInAlert()
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
}
