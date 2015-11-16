//
//  FirstViewController.swift
//  MyTabBarApp
//
//  Created by teklabsco on 11/15/15.
//  Copyright © 2015 Teklabs, LLC. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController, UITableViewDataSource  {

    let moreTableViewValues = [
        ("About App","aboutIcon"),
        ("Contact","contactIcon") ]
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moreTableViewValues.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let (entryTitle,entryIcon) = moreTableViewValues[indexPath.row]
        
        cell.textLabel?.text = entryTitle
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

