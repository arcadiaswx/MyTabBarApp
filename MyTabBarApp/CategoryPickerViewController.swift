//
//  CategoryPickerViewController.swift
//  MyTabBarApp
//
//  Created by teklabsco on 11/17/15.
//  Copyright © 2015 Teklabs, LLC. All rights reserved.
//

import UIKit

class CategoryPickerViewController: UITableViewController {
    
    var categories:[String] = [
        "Health",
        "Job",
        "Wisdom",
        "Faith",
        "Family",
        "Natural Disaster"]
    
    var selectedCategory:String? {
        didSet {
            if let category = selectedCategory {
                selectedCategoryIndex = categories.indexOf(category)!
            }
        }
    }
    var selectedCategoryIndex:Int?
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CategoryCell", forIndexPath: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        
        if indexPath.row == selectedCategoryIndex {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //Other row is selected - need to deselect it
        if let index = selectedCategoryIndex {
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
            cell?.accessoryType = .None
        }
        
        selectedCategory = categories[indexPath.row]
        
        //update the checkmark for the current row
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveSelectedCategory" {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPathForCell(cell)
                if let index = indexPath?.row {
                    selectedCategory = categories[index]
                }
            }
        }
    }
}
