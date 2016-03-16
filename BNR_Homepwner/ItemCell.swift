//
//  ItemCell.swift
//  BNR_Homepwner
//
//  Created by Yohannes Wijaya on 3/16/16.
//  Copyright © 2016 Yohannes Wijaya. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    // MARK: - IBOutlet Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var serialNumberLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    // MARK: - Helper Methods
    
    func refreshLabelsFonts() {
        let fontTextStyleBody = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        self.nameLabel.font = fontTextStyleBody
        self.valueLabel.font = fontTextStyleBody
        
        let fontTextStyleCaption1 = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        self.serialNumberLabel.font = fontTextStyleCaption1
    }
}
