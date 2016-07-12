//
//  People.swift
//  AddressBook
//
//  Created by gongliang on 14-8-26.
//  Copyright (c) 2014年 AB. All rights reserved.
//

import UIKit

class People: NSObject {
    var number: Int
    var name: String
    var telePhone: String
    init(number: Int, name: String, telePhone: String) {
        self.number = number
        self.name = name
        self.telePhone = telePhone
    }
    
    func say(#name: String, tel:String) {
    
    }
}

