//
//  AddressDataManager.swift
//  AddressBook
//
//  Created by gongliang on 14-8-27.
//  Copyright (c) 2014年 AB. All rights reserved.
//

import UIKit

class AddressDataManager: NSObject {
    
    class func peopleDatas() -> NSArray {
        if let array: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("people") {
            var datasArray: NSMutableArray = []
            array.enumerateObjectsUsingBlock ( { (dic, index, stop) -> Void in
                let number = dic["number"] as String
                let name = dic["name"] as String
                let tel = dic["telePhone"] as String
                let people = People(number: number.toInt()!, name: name, telePhone: tel)
                datasArray.addObject(people)
            })
            return datasArray as NSArray
        } else {
            return []
        }
    }
    
    class func savePeople(people: People) {
        if let array: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("people") {
            let dic: Dictionary = ["number": "\(people.number)",
                                     "name": people.name,
                                "telePhone": people.telePhone]
            array.addObject(dic)
            NSUserDefaults.standardUserDefaults().setObject(array, forKey: "people")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    class func deletePeople(people: People) {
        if let array: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("people") {
            array.enumerateObjectsUsingBlock({ (dic, index, stop) -> Void in
                let numberString = dic["number"] as String
                let number = numberString.toInt()
                let name = dic["name"] as String
                let tel = dic["telePhone"] as String
            })
        }
    }
}
