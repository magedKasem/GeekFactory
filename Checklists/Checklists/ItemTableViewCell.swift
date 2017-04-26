//
//  ItemTableViewCell.swift
//  Checklists
//
//  Created by Maged Kasem on 4/23/17.
//  Copyright © 2017 Maged Kasem. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var itemText: UILabel!
    @IBOutlet weak var check: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
