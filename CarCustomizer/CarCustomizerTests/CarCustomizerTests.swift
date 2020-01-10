//
//  CarCustomizerTests.swift
//  CarCustomizerTests
//
//  Created by Barnham, Samuel (ABH) on 10/01/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import XCTest
@testable import CarCustomizer

class CarCustomizerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCarStatsOutputCorrectly() {
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, handling: 6, acceleration: 7.7)
        let expected = """
            Make - Mazda
            Model - MX-5
            Top Speed - 125mph
            Acceleration - 7.7 seconds
            Handling - 6
        """
        
        let actual = car.displayStats()
        XCTAssertEqual(actual, expected)
    }

}
