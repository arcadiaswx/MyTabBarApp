//
//  AppDelegate.swift
//  MyTabBarApp
//
//  Created by teklabsco on 11/15/15.
//  Copyright © 2015 Teklabs, LLC. All rights reserved.
//

import UIKit
import Fabric
import TwitterKit

var tabBarViewController:TabBarViewController?

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        Parse.setApplicationId("b3kPowa2hzp062UsfdaA2yKWRDoP29eFSsZh543S", clientKey:"H01L2KyWEgayClULVYK7oK9jHGE5lrCC8yFg2TJr")
        PFTwitterUtils.initializeWithConsumerKey("kZmUx1XhVHeEx6IdPuakobdTYxIT55HLJBcTuBlLyqs55xcwV1", consumerSecret:"BGbHetUaxrQeYVydJPLKLW3CGnQUx4BonbTppfniufPZW4n7Bx")
        PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions);
        
        //Fabric.with([Twitter.self])
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }

    func applicationDidBecomeActive(application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

