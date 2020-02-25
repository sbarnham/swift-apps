//
//  ViewController.swift
//  CommentCardWriter
//
//  Created by Barnham, Samuel (ABH) on 11/02/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let enjoymentData = ["Really Enjoying...", "Enjoying...","Liking...","Not Enjoying..."]
    let attainmentData = ["Excellent","Very Good","Good","Satisfactory","Poor", "Inadequate"]

    
    @IBOutlet var generatedComment: UILabel!
    @IBOutlet var subjectTextField: UITextField!
    @IBOutlet var AoITextField: UITextField!
    @IBOutlet var enjoymentPicker: UIPickerView!
    @IBOutlet var attainmentPicker: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == enjoymentPicker {
            return enjoymentData.count
        } else {
            return attainmentData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == enjoymentPicker {
            return enjoymentData[row]
        } else {
            return attainmentData[row]
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func subjectTextFieldSelected(_ sender: Any) {
        subjectTextField.backgroundColor = UIColor.white
    }
    
    
    @IBAction func AoITextFieldSelected(_ sender: Any) {
        AoITextField.backgroundColor = UIColor.white
    }
    
    
    
    @IBAction func generateButton(_ sender: Any) {
        if subjectTextField.text == "" {
            subjectTextField.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.3)
        }
        if AoITextField.text == "" {
            AoITextField.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.3)
        }
        let subject = subjectTextField.text!
        let areasOfImprovement = AoITextField.text!
        let comment = CommentFactory.createComment(subject: subject, enjoyment: enjoymentData[enjoymentPicker.selectedRow(inComponent: 0)], areasToImprove: areasOfImprovement, attainment: attainmentData[attainmentPicker.selectedRow(inComponent: 0)])
        generatedComment.text = comment
        if comment.count > 300 {
            commentTooLongAlert()
        }
        
    }
    
    func commentTooLongAlert() {
        let alert = UIAlertController(title: "Length limit exceeded", message: "This generated comment has reached over 300 characters. This may be too long for your comment card. It is recommended that you shorten your responses in the text fields.", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Proceed", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func copyButton(_ sender: Any) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = generatedComment.text
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enjoymentPicker.delegate = self
        enjoymentPicker.dataSource = self
        attainmentPicker.delegate = self
        attainmentPicker.delegate = self
        AoITextField.delegate = self
        subjectTextField.delegate = self
    }
    
    


}

