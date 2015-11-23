/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

class PlayerDetailsViewController: UITableViewController {
  
  var player:Player?
  
  var category:String = "CATEGORY" {
    didSet {
      detailLabel.text? = category
    }
  }
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var detailLabel: UILabel!
  
  required init?(coder aDecoder: NSCoder) {
    print("init PlayerDetailsViewController")
    super.init(coder: aDecoder)
  }
  
  deinit {
    print("deinit PlayerDetailsViewController")
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    if indexPath.section == 0 {
      nameTextField.becomeFirstResponder()
    }
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "SavePlayerDetail" {
      player = Player(name: nameTextField.text, category:category, rating: 1)
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
