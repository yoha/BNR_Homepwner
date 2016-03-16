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
        let newItem = self.itemStore.createItem()
        if let validIndexOfNewItem = self.itemStore.allItems.indexOf(newItem) {
            let indexPathOfNewItem = NSIndexPath(forRow: validIndexOfNewItem, inSection: 0)
            self.tableView.insertRowsAtIndexPaths([indexPathOfNewItem], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
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
        return self.itemStore.allItems.count + 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("ItemCell") as! ItemCell
        
        cell.refreshLabelsFonts()

        if indexPath.row == self.itemStore.allItems.count {
            cell.nameLabel.text = "No more item!"
            cell.serialNumberLabel.text = ""
            cell.valueLabel.text = ""
            
            return cell
        }
        
        let item = self.itemStore.allItems[indexPath.row]
        
        cell.nameLabel.text = item.name
        cell.serialNumberLabel.text = item.serialNumber
        cell.valueLabel.text = "$\(item.valueInDollars)"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let itemToBeDeleted = self.itemStore.allItems[indexPath.row]
            let alertController = UIAlertController(title: "Delete \(itemToBeDeleted.name)", message: "Are you sure you want to delete this item?", preferredStyle: UIAlertControllerStyle.ActionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            let deleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler: { [unowned self] (_) -> Void in
                self.itemStore.deleteItem(itemToBeDeleted)
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            })
            alertController.addAction(cancelAction)
            alertController.addAction(deleteAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        self.itemStore.moveItemAtIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return indexPath.row == self.itemStore.allItems.count ? false : true
    }
    
    // MARK: - UITableViewDelegate Methods
    
    override func tableView(tableView: UITableView, targetIndexPathForMoveFromRowAtIndexPath sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath {
        return proposedDestinationIndexPath.row == self.itemStore.allItems.count ? sourceIndexPath : proposedDestinationIndexPath
    }
    
    // MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let customInsets = UIEdgeInsets(top: statusBarHeight, left: 0.0, bottom: 0.0, right: 0.0)
        self.tableView.contentInset = customInsets
        self.tableView.scrollIndicatorInsets = customInsets
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 65
    }
}