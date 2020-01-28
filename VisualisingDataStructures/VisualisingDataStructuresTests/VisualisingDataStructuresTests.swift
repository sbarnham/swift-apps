//
//  VisualisingDataStructuresTests.swift
//  VisualisingDataStructuresTests
//
//  Created by Barnham, Samuel (ABH) on 28/01/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import XCTest
@testable import VisualisingDataStructures

class VisualisingDataStructuresTests: XCTestCase {

    
    func testPushAddsToTopOfStack() {
        let stack = Stack()
        stack.push(item: "Hi")
        let expected = "Hi"
        
        XCTAssertEqual(stack.values[0], expected)
    }
    
    
    
    func testPopShowsValueAtTopOfStack() {
        let stack = Stack()
        stack.push(item: "Yeet")
        let actual = stack.pop()
        let expected = "Yeet"
        
        XCTAssertEqual(actual, expected)
    }


}
