//
//  DatePickerViewController.swift
//  BNR_Homepwner
//
//  Created by Yohannes Wijaya on 3/29/16.
//  Copyright © 2016 Yohannes Wijaya. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    // MARK: - IBOutlet Properties
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - IBAction Properties
    
    @IBAction func changeDate(sender: UIButton) {
        self.date = self.datePicker.date
    }
    
    // MARK: - Stored Properties
    
    var date: NSDate!
    
    // MARK: - UIViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.datePicker.datePickerMode = UIDatePickerMode.Date
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.datePicker.setDate(self.date, animated: true)
    }

}
