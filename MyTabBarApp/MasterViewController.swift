//
//  ItemsViewController.swift
//  MyTabBarApp
//
//  Created by teklabsco on 11/17/15.
//  Copyright © 2015 Teklabs, LLC. All rights reserved.
//

import UIKit

var noteObjects:[String] = [String]()
var currentIndex:Int = 0
var masterView:MasterViewController?
var detailViewController:DetailViewController?


let kNotes:String = "notes"
let BLANK_NOTE_TITLE:String = "(New Item Note)"

class MasterViewController: UITableViewController {
    
    //@IBOutlet var addItemButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        masterView = self
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
        if noteObjects.count == 0 {
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
        
        if noteObjects.count == 0 || itemObjects[0] != BLANK_NOTE_TITLE {
            noteObjects.insert(BLANK_NOTE_TITLE, atIndex: 0)
            let indexPath = NSIndexPath(forRow: 0, inSection: 0)
            self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        
        currentIndex = 0
        self.performSegueWithIdentifier("showNoteDetail", sender: self)
    }
    
   
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteObjects.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let noteObject = noteObjects[indexPath.row]
        cell.textLabel!.text = noteObject
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
        NSUserDefaults.standardUserDefaults().setObject(noteObjects, forKey: kNotes)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func load() {
        if let loadedData = NSUserDefaults.standardUserDefaults().arrayForKey(kNotes) as? [String] {
            noteObjects = loadedData
        }
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        detailViewController?.detailDescriptionLabel.editable = true
        if segue.identifier == "showNoteDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                currentIndex = indexPath.row
            }
            let noteObject = noteObjects[currentIndex]
            detailViewController?.detailItem = noteObject
            //detailItemViewController?.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
            detailViewController?.navigationItem.leftItemsSupplementBackButton = true
        }
    }

}

