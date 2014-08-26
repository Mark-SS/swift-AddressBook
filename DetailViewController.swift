//
//  DetailViewController.swift
//  AddressBook
//
//  Created by gongliang on 14-8-26.
//  Copyright (c) 2014年 AB. All rights reserved.
//

import UIKit

protocol AddDataProtocol {
    func addDataFinished(people: People)
}

class DetailViewController: UIViewController {

    var number: Int?
    var name: String?
    var telePhone: String?
    var delegate: AddDataProtocol?
    
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var telePhoneField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let aNumber = number {
            numberField.text = "\(aNumber)"
        }
        
        if let aName = name {
            nameField.text = aName
        }
        
        if let aTelePhone = telePhone {
            telePhoneField.text = aTelePhone
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveData(sender: AnyObject) {
        if !numberField.text || numberField.text == "" {
            println("number is not exist")
            return ;
        }
        if !nameField.text || numberField.text == "" {
            println("name is not exist")
            return ;
        }
        if !telePhoneField.text || telePhoneField.text == "" {
            println("phont is not exist")
            return ;
        }
        let people = People(number: numberField.text.toInt()!, name: nameField.text, telePhone: telePhoneField.text)
        delegate?.addDataFinished(people)
        self.navigationController.popViewControllerAnimated(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
