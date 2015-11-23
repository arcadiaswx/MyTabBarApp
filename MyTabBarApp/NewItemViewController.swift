//
//  NewItemViewController.swift
//  MyTabBarApp
//
//  Created by teklabsco on 11/19/15.
//  Copyright © 2015 Teklabs, LLC. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController,UITextViewDelegate {
    
    //var item:Item?
    //let moodArray = [  "Health", "Job", "Wisdom", "Faith", "Family", "Natural Disaster"]

    @IBOutlet weak var newItemLabel: UITextView!

    @IBOutlet weak var cancelButton: UIBarButtonItem!

    @IBOutlet weak var saveButton: UIBarButtonItem!
    

    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if itemObjects.count == 0 {
            return
        }
        if let label = self.newItemLabel {
            //label.text = itemObjects[currentIndex]
            if label.text == BLANK_ITEM_NOTE {
                label.text = ""
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newItemDetailsViewController = self
        newItemLabel.becomeFirstResponder()
        newItemLabel.delegate = self
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if itemObjects.count == 0 {
            return
        }
        itemObjects[currentIndex] = newItemLabel.text
        if newItemLabel.text == "" {
            itemObjects[currentIndex] = BLANK_ITEM_NOTE
        }
        saveAndUpdate()
    }
    
   func saveAndUpdate() {
        masterItemView?.save()
        masterItemView?.tableView.reloadData()
  
    }
    
    @IBAction func didSave(sender: UIBarButtonItem) {
        //saveAndUpdate()
        self.dismissViewControllerAnimated(true, completion:nil)
    }
    
    @IBAction func didCancel(sender: UIBarButtonItem) {
        let theItemIndex = currentIndex
        if theItemIndex == 0 {
            return
        }
        else {
            print("Inside didCancel:", theItemIndex)
            itemObjects.removeAtIndex(theItemIndex)
            //masterItemView?.removeObject(sender: String, objectKey:theItemCount)
            saveAndUpdate()
        }
        /*
        itemObjects[currentIndex] = newItemLabel.text
        if newItemLabel.text == "" {
            itemObjects[currentIndex] = BLANK_ITEM_NOTE
        }
        saveAndUpdate()
       */
        
        self.dismissViewControllerAnimated(true, completion:nil)
    }
    
    
    func textViewDidChange(textView: UITextView) {
        itemObjects[currentIndex] = newItemLabel.text
        print("Inside textViewDidChange:", currentIndex)
        saveAndUpdate()
    }

    
}

