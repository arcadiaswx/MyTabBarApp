//
//  ItemDetailsViewController.swift
//  MyTabBarApp
//
//  Created by teklabsco on 11/17/15.
//  Copyright © 2015 Teklabs, LLC. All rights reserved.
//

import UIKit

class ItemDetailsViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var item:Item?
    let moodArray = [  "Health", "Job", "Wisdom", "Faith", "Family", "Natural Disaster"]

    
    //@IBOutlet weak var titleTextField: UITextField!
    //@IBOutlet weak var categoryPicker: UIPickerView!
    //@IBOutlet weak var notesTextField: UITextField!
    @IBOutlet weak var detailDescriptionLabel: UITextView!
    
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
            item = Item(title: titleTextField.text, category:category, notes: notesTextField.text)
        }
        if segue.identifier == "PickCategory" {
            if let categoryPickerViewController = segue.destinationViewController as? CategoryPickerViewController {
                categoryPickerViewController.selectedCategory = category
            }
        }
    }
    
    
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return moodArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return moodArray[row]
    }
    

    
    @IBAction func didTouchDone(sender: AnyObject) {
    }
    
    @IBAction func didTouchCancel(sender: AnyObject) {
    }
}
