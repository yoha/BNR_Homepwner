//
//  CustomTextField.swift
//  BNR_Homepwner
//
//  Created by Yohannes Wijaya on 3/29/16.
//  Copyright © 2016 Yohannes Wijaya. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        
        self.borderStyle = UITextBorderStyle.Line
        return true
    }
    
    override func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        
        self.borderStyle = .RoundedRect
        return true
    }
}