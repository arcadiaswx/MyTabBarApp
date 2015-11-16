//
//  ListViewController.swift
//  MyTabBarApp
//
//  Created by teklabsco on 11/15/15.
//  Copyright © 2015 Teklabs, LLC. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource  {
    
    let moreTableViewValues = [
        ("Job Search","Jonny Appleseed"),
        ("Aunt Rita's Health","Jonny Appleseed") ]
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moreTableViewValues.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let (courseTitle,courseAuthor) = moreTableViewValues[indexPath.row]
        
        cell.textLabel?.text = courseTitle
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

