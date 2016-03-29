//
//  DetailViewController.swift
//  BNR_Homepwner
//
//  Created by Yohannes Wijaya on 3/26/16.
//  Copyright © 2016 Yohannes Wijaya. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - IBOutlet Properties
    
    @IBOutlet weak var nameTextField: CustomTextField!
    @IBOutlet weak var serialNumberTextField: CustomTextField!
    @IBOutlet weak var valueTextField: CustomTextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - IBAction Methods
    
    @IBAction func backgroundDidTouch(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func unwindToDetailViewController(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindToDetailViewController" else { return }
        guard let validDatePickerViewController = segue.sourceViewController as? DatePickerViewController else { return }
        self.item.dateCreated = validDatePickerViewController.date
    }
    
    @IBAction func takePicture(sender: AnyObject) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) ? .Camera : .PhotoLibrary
        imagePickerController.delegate = self
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: - Stored Properties
    
    var item: Item! {
        didSet {
            self.navigationItem.title = item.name
        }
    }
    
    var imageStore: ImageStore!
    
    // MARK: - Computed Properties
    
    let numberFormatter: NSNumberFormatter = {
       let nf = NSNumberFormatter()
        nf.numberStyle = NSNumberFormatterStyle.DecimalStyle
        nf.minimumFractionDigits = 2
        nf.maximumFractionDigits = 2
        return nf
    }()
    
    let dateFormatter: NSDateFormatter = {
        let df = NSDateFormatter()
        df.dateStyle = NSDateFormatterStyle.MediumStyle
        df.timeStyle = .NoStyle
        return df
    }()
    
    // MARK: - UIViewController Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameTextField.delegate = self
        self.serialNumberTextField.delegate = self
        self.valueTextField.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.nameTextField.text = self.item.name
        self.serialNumberTextField.text = self.item.serialNumber
        self.valueTextField.text = self.numberFormatter.stringFromNumber(self.item.valueInDollars)
        self.dateLabel.text = self.dateFormatter.stringFromDate(self.item.dateCreated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.item.name = self.nameTextField.text ?? ""
        self.item.serialNumber = self.serialNumberTextField.text ?? ""
        guard let validValueText = self.valueTextField.text, let value = self.numberFormatter.numberFromString(validValueText) else {
            self.item.valueInDollars = 0
            return
        }
        self.item.valueInDollars = value.integerValue
        
        self.view.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard segue.identifier == "segueToDatePickerViewController" else { return }
        guard let validDatePickerViewController = segue.destinationViewController as? DatePickerViewController else { return }
        validDatePickerViewController.date = self.item.dateCreated
    }
    
    // MARK: - UIImagePickerControllerDelegate Methods
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        guard let validSelectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        self.imageView.image = validSelectedImage
        self.imageStore.setImage(validSelectedImage, forKey: self.item.itemKey)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - UITextFieldDelegate Methods
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
