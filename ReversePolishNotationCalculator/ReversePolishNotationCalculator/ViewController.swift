//
//  ViewController.swift
//  ReversePolishNotationCalculator
//
//  Created by Barnham, Samuel (ABH) on 08/06/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let calculator = Calculator()
    var currentOperand = ""

    @IBOutlet var calculatorDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorDisplay.text! = ""
        // Do any additional setup after loading the view.
    }
    
    func checkIfExceeded3Digits() -> Bool {
        if currentOperand.count == 3 {
            return true
        }
        return false
    }
    
    
    @IBAction func enterOne(_ sender: Any) {
        if checkIfExceeded3Digits() {
            return
        }
        currentOperand.append("1")
        calculatorDisplay.text!.append("1")
    }
    
    
    @IBAction func enterTwo(_ sender: Any) {
        if checkIfExceeded3Digits() {
            return
        }
        currentOperand.append("2")
        calculatorDisplay.text!.append("2")
    }
    
    
    @IBAction func enterThree(_ sender: Any) {
        if checkIfExceeded3Digits() {
            return
        }
        currentOperand.append("3")
        calculatorDisplay.text!.append("3")
    }
    
    
    @IBAction func enterFour(_ sender: Any) {
        if checkIfExceeded3Digits() {
            return
        }
        currentOperand.append("4")
        calculatorDisplay.text!.append("4")
    }
    
    
    @IBAction func enterFive(_ sender: Any) {
        if checkIfExceeded3Digits() {
            return
        }
        currentOperand.append("5")
        calculatorDisplay.text!.append("5")
    }
    
    
    @IBAction func enterSix(_ sender: Any) {
        if checkIfExceeded3Digits() {
            return
        }
        currentOperand.append("6")
        calculatorDisplay.text!.append("6")
    }
    
    
    @IBAction func enterSeven(_ sender: Any) {
        if checkIfExceeded3Digits() {
            return
        }
        currentOperand.append("7")
        calculatorDisplay.text!.append("7")
    }
    
    
    @IBAction func enterEight(_ sender: Any) {
        if checkIfExceeded3Digits() {
            return
        }
        currentOperand.append("8")
        calculatorDisplay.text!.append("8")
    }
    
    
    @IBAction func enterNine(_ sender: Any) {
        if checkIfExceeded3Digits() {
            return
        }
        currentOperand.append("9")
        calculatorDisplay.text!.append("9")
    }
    
    
    @IBAction func enterZero(_ sender: Any) {
        if checkIfExceeded3Digits() || (currentOperand.count == 1 && currentOperand == "0") {
            return
        }
        currentOperand.append("0")
        calculatorDisplay.text!.append("0")
    }

    
    @IBAction func confirmOperand(_ sender: Any) {
        calculator.expression.append(currentOperand)
        currentOperand.removeAll()
    }
    
    
    @IBAction func flipSign(_ sender: Any) {
        var array = Array(currentOperand)
        let index = currentOperand.count
        if array[0] == "-" {
            array.remove(at: 0)
            currentOperand = String(array)
            calculatorDisplay.text?.remove(at: calculatorDisplay.text!.index( calculatorDisplay.text!.endIndex, offsetBy: -index))
            return
        }
        array.insert("-", at: 0)
        currentOperand = String(array)
        calculatorDisplay.text?.insert("-", at: calculatorDisplay.text!.index(calculatorDisplay.text!.endIndex, offsetBy: -index))
    }
    
    fileprivate func operatorEnter(op: String) {
        if currentOperand.count != 0 {
            calculator.expression.append(currentOperand)
        }
        calculator.expression.append(op)
        currentOperand.removeAll()
        calculatorDisplay.text!.append("\(op)")
    }
    
    @IBAction func enterPlus(_ sender: Any) {
        operatorEnter(op: "+")
    }
    
    
    @IBAction func enterMinus(_ sender: Any) {
        operatorEnter(op: "-")
    }
    
    @IBAction func enterMultiply(_ sender: Any) {
        operatorEnter(op: "*")
    }
    
    
    @IBAction func enterDivide(_ sender: Any) {
        operatorEnter(op: "/")
    }
    
    @IBAction func clearButton(_ sender: Any) {
        currentOperand.removeAll()
        calculator.expression.removeAll()
        calculatorDisplay.text!.removeAll()
    }
    
    func errorAlert() {
        let alert = UIAlertController(title: "Invalid expression", message: "Please enter the expression again", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    
    @IBAction func evaluationButton(_ sender: Any) {
        guard let result = calculator.evaluate() else {
            calculatorDisplay.text! = ""
            errorAlert()
            return
        }
        calculatorDisplay.text! = String(result)
    }
    
    
}


