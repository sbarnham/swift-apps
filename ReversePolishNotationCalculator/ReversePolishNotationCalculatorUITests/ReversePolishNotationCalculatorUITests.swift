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
    }
    
    func testClearButtonResetsDisplay() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.buttons["1"].tap()
        app.buttons["4"].tap()
        app.buttons["6"].tap()
        app.buttons["clear"].tap()
        XCTAssertEqual(app.staticTexts["display"].label, "")
    }
    
    func testEvalButtonEvaluatesCurrentExpressionEnteredAndPresentsResult() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.buttons["7"].tap()
        app.buttons["0"].tap()
        app.buttons["enter"].tap()
        app.buttons["9"].tap()
        app.buttons["*"].tap()
        app.buttons["9"].tap()
        app.buttons["enter"].tap()
        app.buttons["9"].tap()
        app.buttons["+"].tap()
        app.buttons["-"].tap()
        app.buttons["eval"].tap()
        XCTAssertEqual(app.staticTexts["display"].label, "612")
    }
    
    func testInvalidExpressionMakesDisplayIsBlank() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.buttons["8"].tap()
        app.buttons["0"].tap()
        app.buttons["enter"].tap()
        app.buttons["/"].tap()
        app.buttons["eval"].tap()
        XCTAssertEqual(app.staticTexts["display"].label, "")
        
    }
}

