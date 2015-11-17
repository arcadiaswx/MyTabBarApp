//
//  ItemCell.swift
//  MyTabBarApp
//
//  Created by teklabsco on 11/17/15.
//  Copyright © 2015 Teklabs, LLC. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemCategoryLabel: UILabel!
    @IBOutlet weak var itemNotesLabel: UILabel!
    //@IBOutlet weak var itemImageView: UIImageView!
    
    var item: Item! {
        didSet {
            itemTitleLabel.text = item.title
            itemCategoryLabel.text = item.category
            itemNotesLabel.text = item.notes
            //itemImageView.image = imageForItem(item.iconName)
        }
    }
    
    func imageForItem(iconName:String?) -> UIImage? {
        let iconImageName = "\(iconName)Icon"
        return UIImage(named: iconImageName)
    }
    
    
}