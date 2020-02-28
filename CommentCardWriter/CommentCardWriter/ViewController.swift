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
    @IBOutlet var subjectInput: UITextField!
    @IBOutlet var areasOfImprovementInput: UITextField!
    @IBOutlet var enjoymentPicker: UIPickerView!
    @IBOutlet var attainmentPicker: UIPickerView!
    @IBOutlet var effortSlider: UISlider!
    @IBOutlet var talentsInput: UITextField!
    
    
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
        subjectInput.backgroundColor = UIColor.white
    }
    
    
    @IBAction func AoITextFieldSelected(_ sender: Any) {
        areasOfImprovementInput.backgroundColor = UIColor.white
    }
    
    
    
    @IBAction func generateButton(_ sender: Any) {
        if subjectInput.text == "" {
            subjectInput.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.3)
        }
        if areasOfImprovementInput.text == "" {
            areasOfImprovementInput.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.3)
        }
        if talentsInput.text == "" {
            talentsInput.backgroundColor = UIColor(red: 1, green: 0.647, blue: 0.0, alpha: 0.3)
        }
        let subject = subjectInput.text!
        let areasOfImprovement = areasOfImprovementInput.text!
        let talents = talentsInput.text!
        let comment = CommentFactory.createComment(subject: subject, enjoyment: enjoymentData[enjoymentPicker.selectedRow(inComponent: 0)], areasToImprove: areasOfImprovement, attainment: attainmentData[attainmentPicker.selectedRow(inComponent: 0)], effort: effortDecoder(), talents: talents)
        generatedComment.text = comment
        if comment.count > 400 {
            commentTooLongAlert()
        }
        
    }
    
    func effortDecoder() -> String {
        if effortSlider.value == 0 {
            return "no"
        } else if effortSlider.value < 0.25 {
            return "little"
        } else if effortSlider.value < 0.5 {
            return "some"
        } else if effortSlider.value < 0.75 {
            return "good"
        } else if effortSlider.value < 1 {
            return "a lot of"
        } else if effortSlider.value == 1 {
            return "maximum"
        }
        return ""
    }
    
    func commentTooLongAlert() {
        let alert = UIAlertController(title: "Length limit exceeded", message: "This generated comment has reached over 400 characters. This may be too long for your comment card. You must shorten your responses in the text fields before submitting.", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
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
        areasOfImprovementInput.delegate = self
        subjectInput.delegate = self
        subjectInput.placeholder = "Essential"
        areasOfImprovementInput.placeholder = "Essential"
        talentsInput.placeholder = "Recommended"
    }
    
    


}

