//
//  AppIntroViewController.swift
//  MyTabBarApp
//
//  Created by teklabsco on 11/16/15.
//  Copyright © 2015 Teklabs, LLC. All rights reserved.
//

import UIKit

class AppIntroViewController: UIViewController {

    @IBOutlet weak var appIntroUserLabel: UILabel!
    @IBAction func skipAppIntro(sender: AnyObject) {
        print("You are inside the skip App Intro function.")
        self.dismissViewControllerAnimated(true, completion: nil)
        //WelcomeViewController.showAppIntro = false
        //showAppIntro = false
        //return showAppIntro
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
    }
    override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    }
}
