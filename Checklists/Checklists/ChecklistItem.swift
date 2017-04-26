//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Maged Kasem on 4/23/17.
//  Copyright © 2017 Maged Kasem. All rights reserved.
//

import Foundation
class ChecklistItem : NSObject, NSCoding {
    var itemText = ""
    var checked = false
    
    required init?(coder aDecoder : NSCoder) {
        itemText = aDecoder.decodeObject(forKey: "Text") as! String
        checked = aDecoder.decodeBool(forKey: "Checked")
        super.init()

    }
    
    override init() {
        super.init()
    }
    
    

    func encode (with aCoder : NSCoder){
        aCoder.encode(itemText, forKey: "Text")
        aCoder.encode(checked, forKey: "Checked")
    }
    
    func toggleChecked() {
        checked = !checked
    }
}
