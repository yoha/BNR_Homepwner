//
//  ItemsViewController.swift
//  BNR_Homepwner
//
//  Created by Yohannes Wijaya on 3/10/16.
//  Copyright © 2016 Yohannes Wijaya. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController {
    
    // MARK: - Stored Properties
    
    var itemStore: ItemStore!
    
    // MARK: - IBAction Methods
    
    @IBAction func addNewItem(sender: UIButton) {
        
    }
    
    @IBAction func toggleEditingMode(sender: UIButton) {
        if self.editing {
            sender.setTitle("Edit", forState: UIControlState.Normal)
            self.setEditing(false, animated: true)
        }
        else {
            sender.setTitle("Done", forState: .Normal)
            self.setEditing(true, animated: true)
        }
    }
    
    // MARK: - UITableViewDataSource Methods
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemStore.allItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Get a new or recycled cell
        let cell = self.tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
        
        // Set the text on the cell w/ the description of the item that is at the nth index of items, where n = row this cell will appear in on the tableview
        let item = self.itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
    
    // MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let customInsets = UIEdgeInsets(top: statusBarHeight, left: 0.0, bottom: 0.0, right: 0.0)
        self.tableView.contentInset = customInsets
        self.tableView.scrollIndicatorInsets = customInsets
    }
}