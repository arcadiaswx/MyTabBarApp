//
//  ItemsViewController.swift
//  MyTabBarApp
//
//  Created by teklabsco on 11/17/15.
//  Copyright © 2015 Teklabs, LLC. All rights reserved.
//

import UIKit

var itemObjects:[String] = [String]()
var currentIndex:Int = 0
var itemView:ItemsViewController?
var itemDetailsViewController:ItemDetailsViewController?

let kItemNotes:String = "notes"
let BLANK_ITEM_NOTE:String = "(New Item Note)"

class ItemsViewController: UITableViewController {
    
    //var items:[Item] = itemsData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        itemView = self
        load()
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemObjects.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let itemObject = itemObjects[indexPath.row]
        cell.textLabel!.text = itemObject
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            itemObjects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated:animated)
        if editing {
            itemDetailsViewController?.detailDescriptionLabel.editable = false
            itemDetailsViewController?.detailDescriptionLabel.text = ""
            return
        }
        save()
    }
    
    override func tableView(tableView: UITableView, didEndEditingRowAtIndexPath indexPath: NSIndexPath) {
        itemDetailsViewController?.detailDescriptionLabel.editable = false
        itemDetailsViewController?.detailDescriptionLabel.text = ""
        save()
    }

    

    
    func save() {
        NSUserDefaults.standardUserDefaults().setObject(itemObjects, forKey: kItemNotes)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func load() {
        if let loadedData = NSUserDefaults.standardUserDefaults().arrayForKey(kItemNotes) as? [String] {
            itemObjects = loadedData
        }
    }
}
