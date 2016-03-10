//
//  ItemsViewController.swift
//  BNR_Homepwner
//
//  Created by Yohannes Wijaya on 3/10/16.
//  Copyright © 2016 Yohannes Wijaya. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController, UITableViewDataSource {
    var itemStore: ItemStore!
    
    // MARK: - UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemStore.allItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        <#code#>
    }
}