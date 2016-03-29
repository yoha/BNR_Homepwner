//
//  ImageStore.swift
//  BNR_Homepwner
//
//  Created by Yohannes Wijaya on 3/29/16.
//  Copyright © 2016 Yohannes Wijaya. All rights reserved.
//

import UIKit

class ImageStore {
    
    // MARK: - Stored Properties
    
    let cache = NSCache()
    
    // MARK: - Local Methods
    
    func setImage(image: UIImage, forKey key: String) {
        self.cache.setObject(image, forKey: key)
    }
    
    func getImageForKey(key: String) -> UIImage? {
        return self.cache.objectForKey(key) as? UIImage
    }
    
    func deleteImageForKey(key: String) {
        self.cache.removeObjectForKey(key)
    }
}


