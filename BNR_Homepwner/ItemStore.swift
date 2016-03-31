//
//  ItemStore.swift
//  BNR_Homepwner
//
//  Created by Yohannes Wijaya on 3/10/16.
//  Copyright © 2016 Yohannes Wijaya. All rights reserved.
//

import UIKit

class ItemStore {
    
    // MARK: - Stored Properties
    
    var allItems = [Item]()
    let itemArchiveUrl: NSURL = {
        let documentDirectory = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask).first!
        return documentDirectory.URLByAppendingPathComponent("items.archive")
    }()
    
    // MARK: - Designated Initalizer
    
    init() {
        guard let archivedItems = NSKeyedUnarchiver.unarchiveObjectWithFile(self.itemArchiveUrl.path!) as? [Item] else { return }
        self.allItems = archivedItems
    }
    
    // MARK: - Helper Methods
    
    func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
    
    func deleteItem(item: Item) {
        if let validIndexOfItem = self.allItems.indexOf(item) {
            self.allItems.removeAtIndex(validIndexOfItem)
        }
    }
    
    func moveItemAtIndex(fromIndex: Int, toIndex: Int) {
        if fromIndex == toIndex { return }
        
        // Get reference to object being moved before it's removed
        let movedItem = self.allItems[fromIndex]
        
        // Remove item from the array
        self.allItems.removeAtIndex(fromIndex)
        
        // Insert item in array at new location
        self.allItems.insert(movedItem, atIndex: toIndex)
    }
    
    func saveChanges() -> Bool {
        print("Saving items to: \(self.itemArchiveUrl.path!)")
        return NSKeyedArchiver.archiveRootObject(self.allItems, toFile: self.itemArchiveUrl.path!)
    }
}