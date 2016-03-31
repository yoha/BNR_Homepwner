//
//  Item.swift
//  BNR_Homepwner
//
//  Created by Yohannes Wijaya on 3/10/16.
//  Copyright © 2016 Yohannes Wijaya. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    var dateCreated: NSDate
    var itemKey: String
    
    // MARK: - Designated Initializer
    
    init(name: String, valueInDollars: Int, serialNumber: String?) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = NSDate()
        self.itemKey = NSUUID().UUIDString
        
        super.init()
    }
    
    // MARK: - Convenience Initializer 
    
    convenience init(random: Bool = false) {
        if random {
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            var randomIdx = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjective = adjectives[Int(randomIdx)]
            
            randomIdx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(randomIdx)]
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            let randomSerialNumber = NSUUID().UUIDString.componentsSeparatedByString("-").first!
            
            self.init(name: randomName, valueInDollars: randomValue, serialNumber: randomSerialNumber)
        }
        else {
            self.init(name: "", valueInDollars: 0, serialNumber: nil)
        }
    }
    
    // MARK: - NSCoding Protocols
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeInteger(self.valueInDollars, forKey: "valueInDollars")
        aCoder.encodeObject(self.serialNumber, forKey: "serialNumber")
        aCoder.encodeObject(self.dateCreated, forKey: "dateCreated")
        aCoder.encodeObject(self.itemKey, forKey: "itemKey")
    }
    
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.valueInDollars = aDecoder.decodeIntegerForKey("valueInDollars")
        self.serialNumber = aDecoder.decodeObjectForKey("serialNumber") as! String?
        self.dateCreated = aDecoder.decodeObjectForKey("dateCreated") as! NSDate
        self.itemKey = aDecoder.decodeObjectForKey("itemKey") as! String
        
        super.init()
    }
}

