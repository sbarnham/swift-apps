//
//  Calculator.swift
//  ReversePolishNotationCalculator
//
//  Created by Barnham, Samuel (ABH) on 08/06/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import Foundation

class Calculator {
    var expressionStack: [Int] = []
    var expression = ""
    
    
    
    var parts = [String]()
    
    
    func evaluate() -> Int? {
        parts = expression.components(separatedBy: " ")
        for part in parts {
            if isNumber(part: part) {
                expressionStack.append(Int(part)!) //force unwrap justified by passing guard statement in isNumber()
            } else if isValidOperator(part: part) {
                guard let operand1 = expressionStack.popLast() else { return nil }
                guard let operand2 = expressionStack.popLast() else { return nil }
                if part == "+" {
                    expressionStack.append(operand1 + operand2)
                } else if part == "*" {
                    expressionStack.append(operand1 * operand2)
                } else if part == "/" {
                    expressionStack.append(operand1 / operand2)
                } else if part == "-" {
                    expressionStack.append(operand1 - operand2)
                }
            } else {
                print("Error encountered. Unknown value in expression.")
                return nil
            }
        }
        return expressionStack.popLast() ?? 0
    }
    
    func isNumber(part: String) -> Bool {
        guard let _ = Int(part) else {
            return false
        }
        return true
    }
    
    func isValidOperator(part: String) -> Bool {
        if part == "+" || part == "*" || part == "/" || part == "-" {
            return true
        }
        return false
    }
    
    
}
