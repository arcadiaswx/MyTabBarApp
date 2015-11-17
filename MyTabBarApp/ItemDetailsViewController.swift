//
//  ItemDetailsViewController.swift
//  MyTabBarApp
//
//  Created by teklabsco on 11/17/15.
//  Copyright © 2015 Teklabs, LLC. All rights reserved.
//

import UIKit

class ItemDetailsViewController: UITableViewController {
    
    var item:Item?
    
    var category:String = "Peace" {
        didSet {
            detailLabel.text? = category
        }
    }
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        print("init ItemDetailsViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("deinit ItemDetailsViewController")
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            titleTextField.becomeFirstResponder()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveItemDetail" {
            item = Item(title: titleTextField.text, category:category, notes: "Some notes")
        }
        if segue.identifier == "PickCategory" {
            if let categoryPickerViewController = segue.destinationViewController as? CategoryPickerViewController {
                categoryPickerViewController.selectedCategory = category
            }
        }
    }
    
    //Unwind segue
    @IBAction func unwindWithSelectedGame(segue:UIStoryboardSegue) {
        if let categoryPickerViewController = segue.sourceViewController as? CategoryPickerViewController,
            selectedCategory = categoryPickerViewController.selectedCategory {
                category = selectedCategory
        }
    }
    
}
