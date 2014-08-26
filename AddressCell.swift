//
//  AddressCell.swift
//  AddressBook
//
//  Created by gongliang on 14-8-26.
//  Copyright (c) 2014年 AB. All rights reserved.
//

import UIKit

class AddressCell: UITableViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var telePhoneLabel: UILabel!
    
    var people: People?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
