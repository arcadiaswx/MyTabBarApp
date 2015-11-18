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
        welcomeView!.saveAppSettings()
        self.dismissViewControllerAnimated(true, completion: nil)

        //return showAppIntro
    }

    
    var appIntroUserObject: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if appIntroStatus == "0" {
            return
        }
        if let label = self.appIntroUserLabel {
            label.text = appIntroStatus
            if label.text == BLANK_STATUS {
                label.text = ""
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        appIntroViewController = self
        appIntroUserLabel.becomeFirstResponder()
       // appIntroUserLabel.delegate = self
        self.configureView()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
}
