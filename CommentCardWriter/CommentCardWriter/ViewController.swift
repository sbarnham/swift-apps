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
    
    @IBAction func generateButton(_ sender: Any) {
        let subject = subjectTextField.text!
        let areasOfImprovement = AoITextField.text!
        let comment = CommentFactory.createComment(subject: subject, enjoyment: enjoymentData[enjoymentPicker.selectedRow(inComponent: 0)], areasToImprove: areasOfImprovement, attainment: attainmentData[attainmentPicker.selectedRow(inComponent: 0)])
        generatedComment.text = comment
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

