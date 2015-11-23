//
//  Item.swift
//  MyTabBarApp
//
//  Created by teklabsco on 11/17/15.
//  Copyright © 2015 Teklabs, LLC. All rights reserved.
//

import Foundation

class Item: PFObject, PFSubclassing {
    var title: String?
    var category: String?
    var note: String?
    
    
    //1
    class func parseClassName() -> String {
        return "Item"
    }
    
    //2
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    override class func query() -> PFQuery? {
        let query = PFQuery(className: Item.parseClassName()) //1
        //query.includeKey("user") //2
        //query.orderByDescending("createdAt") //3
        return query
    }
    
    init(title: String, category: String?, note: String?) {
        super.init()
        
        self.title = title
        self.category = category
        self.note = note
    }
    
    override init() {
        super.init()
    }
    

}

