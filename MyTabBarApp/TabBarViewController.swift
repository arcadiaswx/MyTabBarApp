//
//  TabBarViewController.swift
//  MyTabBarApp
//
//  Created by teklabsco on 11/16/15.
//  Copyright © 2015 Teklabs, LLC. All rights reserved.
//

import Foundation

@objc protocol TabBarControllerDelegate {
    func tabBarController(tabBarController: UITabBarController)
}

class TabBarViewController: UITabBarController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var navController: UINavigationController?
    
    var currentUser: PFObject?
    override func viewDidLoad() {
    super.viewDidLoad()
    
    // iOS 7 style
    //self.tabBar.tintColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 50.0/255.0, alpha: 1.0)
    self.tabBar.tintColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    
    //self.tabBar.barTintColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    self.tabBar.barTintColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    
    self.navController = UINavigationController()
}

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
    //return UIStatusBarStyle.LightContent
    return UIStatusBarStyle.Default
    }
}