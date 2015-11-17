//
//  Item.swift
//  MyTabBarApp
//
//  Created by teklabsco on 11/17/15.
//  Copyright © 2015 Teklabs, LLC. All rights reserved.
//

import UIKit

struct Item {
    var title: String?
    var category: String?
    var notes: String?
    
    init(title: String?, category: String?, notes: String?) {
        self.title = title
        self.category = category
        self.notes = notes
    }
}