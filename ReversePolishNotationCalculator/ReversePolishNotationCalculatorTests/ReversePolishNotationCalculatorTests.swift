//
//  ReversePolishNotationCalculatorTests.swift
//  ReversePolishNotationCalculatorTests
//
//  Created by Barnham, Samuel (ABH) on 08/06/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import XCTest
@testable import ReversePolishNotationCalculator

class ReversePolishNotationCalculatorTests: XCTestCase {

    func testCheckValidTwoDigitExpressionReturnsCorrectResultForMultiplication() {
        let calculator = Calculator()
        calculator.expression.append("20")
        calculator.expression.append("25")
        calculator.expression.append("*")
        let result = calculator.evaluate()
        XCTAssertEqual(result!, 500)
    }
    
    func testCheckValidTwoDigitExpressionReturnsCorrectResultForSubtraction() {
        let calculator = Calculator()
        calculator.expression.append("20")
        calculator.expression.append("25")
        calculator.expression.append("-")
        let result = calculator.evaluate()
        XCTAssertEqual(result!, -5)
    }
    func testCheckValidTwoDigitExpressionReturnsCorrectResultForAddition() {
        let calculator = Calculator()
        calculator.expression.append("20")
        calculator.expression.append("25")
        calculator.expression.append("+")
        let result = calculator.evaluate()
        XCTAssertEqual(result!, 45)
    }
    func testCheckValidTwoDigitExpressionReturnsCorrectResultForDivision() {
        let calculator = Calculator()
        calculator.expression.append("20")
        calculator.expression.append("25")
        calculator.expression.append("/")
        let result = calculator.evaluate()
        XCTAssertEqual(result!, 0)
    }
    func testCheckInvalidExpressionReturnsNil() {
        let calculator = Calculator()
        calculator.expression.append("r73")
        calculator.expression.append("y73")
        calculator.expression.append("*")
        let result = calculator.evaluate()
        XCTAssertEqual(result, nil)
    }
    
    func testCheckMissingOperandReturnsNil() {
        let calculator = Calculator()
        calculator.expression.append("73")
        calculator.expression.append("*")
        let result = calculator.evaluate()
        XCTAssertEqual(result, nil)
    }

}
