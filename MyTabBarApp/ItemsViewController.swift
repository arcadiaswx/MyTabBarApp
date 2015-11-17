//
//  ItemsViewController.swift
//  MyTabBarApp
//
//  Created by teklabsco on 11/17/15.
//  Copyright © 2015 Teklabs, LLC. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var items:[Item] = itemsData
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath)
                as! ItemCell
            
            let item = items[indexPath.row] as Item
            cell.item = item
            return cell
    }
    
    // Mark Unwind Segues
    @IBAction func cancelToItemsViewController(segue:UIStoryboardSegue) {
    }
    
    @IBAction func saveItemDetail(segue:UIStoryboardSegue) {
        if let itemDetailsViewController = segue.sourceViewController as? ItemDetailsViewController {
            
            //add the new item to the itemss array
            if let item = itemDetailsViewController.item {
                items.append(item)
                
                //update the tableView
                let indexPath = NSIndexPath(forRow: items.count-1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    }
}
