//
//  ReversePolishNotationCalculatorUITests.swift
//  ReversePolishNotationCalculatorUITests
//
//  Created by Barnham, Samuel (ABH) on 08/06/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import XCTest

class ReversePolishNotationCalculatorUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDisplaySwitchesSignWhenSwapSignButtonPressed() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.buttons["5"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["swapsign"].tap()
        XCTAssertEqual(app.staticTexts["display"].label, "-523")

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
