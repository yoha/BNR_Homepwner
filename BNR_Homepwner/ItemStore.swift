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
    
    // MARK: - Designated Initializer
    
    init() {
        for _ in 0..<5 {
            self.createItem()
        }
    }
    
    // MARK: - Helper Methods
    
    private func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
}