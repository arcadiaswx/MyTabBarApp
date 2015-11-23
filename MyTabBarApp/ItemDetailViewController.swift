//
//  ItemDetailViewController.swift
//  MyTabBarApp
//
//  Created by teklabsco on 11/23/15.
//  Copyright © 2015 Teklabs, LLC. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController,UITextViewDelegate {
    
    @IBOutlet weak var itemTitleLabel: UITextView!
    @IBOutlet weak var itemNoteLabel: UITextView!
    
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
        if let titleLabel = self.itemTitleLabel {
            titleLabel.text = itemObjects[currentIndex]
            if titleLabel.text == BLANK_ITEM_TITLE {
                titleLabel.text = ""
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        itemDetailViewController = self
        itemTitleLabel.becomeFirstResponder()
        itemTitleLabel.delegate = self
        
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
        itemObjects[currentIndex] = itemTitleLabel.text
        if itemTitleLabel.text == "" {
            itemObjects[currentIndex] = BLANK_ITEM_TITLE
        }
        saveAndUpdate()
    }
    
    func saveAndUpdate() {
        masterView?.save()
        masterView?.tableView.reloadData()
    }
    
    func textViewDidChange(textView: UITextView) {
        itemObjects[currentIndex] = itemTitleLabel.text
        
        saveAndUpdate()
    }
    
}
