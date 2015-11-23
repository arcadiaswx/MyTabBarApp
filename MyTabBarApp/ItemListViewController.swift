//
//  ItemListViewController.swift
//  MyTabBarApp
//
//  Created by teklabsco on 11/23/15.
//  Copyright © 2015 Teklabs, LLC. All rights reserved.
//

import UIKit
//import Item


var itemObjects:[String] = [String]()
var currentItemIndex:Int = 0
var itemListView:ItemListViewController?
var itemDetailViewController:ItemDetailViewController?


let kItems:String = "items"
let BLANK_ITEM_TITLE:String = "(New Item TITLE)"

class ItemListViewController: UITableViewController {
    
    //@IBOutlet var addItemButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        itemListView = self
        load()
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        let addItemButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addItemButton
    }
    
    override func viewWillAppear(animated: Bool) {
        //self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        save()
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        if itemObjects.count == 0 {
            insertNewObject(self)
        }
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func insertNewObject(sender: AnyObject) {
        if detailViewController?.detailDescriptionLabel.editable == false {
            return
        }
        
        if itemObjects.count == 0 || itemObjects[0] != BLANK_ITEM_TITLE {
            itemObjects.insert(BLANK_ITEM_TITLE, atIndex: 0)
            let indexPath = NSIndexPath(forRow: 0, inSection: 0)
            self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        
        currentIndex = 0
        self.performSegueWithIdentifier("showItemDetail", sender: self)
    }
    
    
    
    // MARK: - Table View
    
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
            detailViewController?.detailDescriptionLabel.editable = false
            detailViewController?.detailDescriptionLabel.text = ""
            return
        }
        save()
    }
    
    override func tableView(tableView: UITableView, didEndEditingRowAtIndexPath indexPath: NSIndexPath) {
        detailViewController?.detailDescriptionLabel.editable = false
        detailViewController?.detailDescriptionLabel.text = ""
        save()
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        print("Made it to selection.")
        self.performSegueWithIdentifier("showItemDetail", sender: self)
    }
    
    func save() {
        NSUserDefaults.standardUserDefaults().setObject(itemObjects, forKey: kItems)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func load() {
        if let loadedData = NSUserDefaults.standardUserDefaults().arrayForKey(kItems) as? [String] {
            itemObjects = loadedData
        }
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        detailViewController?.detailDescriptionLabel.editable = true
        if segue.identifier == "showItemDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                currentIndex = indexPath.row
            }
            let itemObject = itemObjects[currentIndex]
            detailViewController?.detailItem = itemObject
            //detailItemViewController?.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
            detailViewController?.navigationItem.leftItemsSupplementBackButton = true
        }
    }
    
}