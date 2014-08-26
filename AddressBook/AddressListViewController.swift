//
//  AddressListViewController.swift
//  AddressBook
//
//  Created by gongliang on 14-8-26.
//  Copyright (c) 2014年 AB. All rights reserved.
//

import UIKit

class AddressListViewController: UITableViewController, AddDataProtocol, UITableViewDelegate {
    
    var tableData: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var people = People(number: 100001, name: "mark", telePhone: "18668222270")
        tableData.addObject(people)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: AddDataProtocol
    func addDataFinished(people: People) {
        tableData.addObject(people)
        self.tableView.reloadData()
    }
    
    // MARK: IBOutlet Action
    @IBAction func addAddressBook(sender: AnyObject) {
        self.performSegueWithIdentifier("detailIdentifier", sender: "add")
    }
    
    // MARK: - Table view data source
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return tableData.count
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("addressCellIdentifier", forIndexPath: indexPath) as AddressCell
        let people = tableData[indexPath.row] as People
        cell.numberLabel.text = "\(people.number)"
        cell.nameLabel.text = people.name
        cell.telePhoneLabel.text = people.telePhone
        // Configure the cell...

        return cell
    }
    
    // MARK: - Table View Delegate
    override func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 44.0
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        self.performSegueWithIdentifier("detailIdentifier", sender: indexPath)
    }

    //MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "detailIdentifier" {
            let detailVC = segue.destinationViewController as DetailViewController
            detailVC.delegate = self
            if sender.isKindOfClass(NSIndexPath) {
                detailVC.title = "Detail"
                let people = tableData[sender.row] as People
                detailVC.name = people.name
                detailVC.number = people.number
                detailVC.telePhone = people.telePhone
            } else {
                detailVC.title = "Add"
            }
        }
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }

}
