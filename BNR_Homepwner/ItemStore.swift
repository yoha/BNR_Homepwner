//
//  ItemStore.swift
//  BNR_Homepwner
//
//  Created by Yohannes Wijaya on 3/10/16.
//  Copyright © 2016 Yohannes Wijaya. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
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
}