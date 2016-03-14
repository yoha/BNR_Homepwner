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
    var itemsAboveOrEqualTo50 = [Item]()
    var itemsBelow50 = [Item]()
    var itemsOfAllPrices = [[Item]]()
    let sectionHeaderTitles = ["Below $50", "$50 or above"]
    
    // MARK: - UITableViewDataSource Methods
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.itemsOfAllPrices.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemsOfAllPrices[section].count
//        return self.itemStore.allItems.count + 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Create custom cell just to display "no more item" on the last line
        if indexPath.row == self.itemStore.allItems.count {
            let cell = self.tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
            cell.textLabel?.text = "No more item"
            cell.detailTextLabel?.text = ""
            return cell
        }
        // Get a new or recycled cell
        let cell = self.tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
        
        // Set the text on the cell w/ the description of the item that is at the nth index of items, where n = row this cell will appear in on the tableview
//        let item = self.itemStore.allItems[indexPath.row]
        let item = self.itemsOfAllPrices[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionHeaderTitles[section]
    }
    
    // MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let customInsets = UIEdgeInsets(top: statusBarHeight, left: 0.0, bottom: 0.0, right: 0.0)
        self.tableView.contentInset = customInsets
        self.tableView.scrollIndicatorInsets = customInsets
        
        for item in self.itemStore.allItems {
            if item.valueInDollars >= 50 {
                self.itemsAboveOrEqualTo50.append(item)
            }
            else {
                self.itemsBelow50.append(item)
            }
        }
        self.itemsOfAllPrices.append(self.itemsBelow50)
        self.itemsOfAllPrices.append(self.itemsAboveOrEqualTo50)
    }
}