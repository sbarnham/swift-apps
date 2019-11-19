//
//  TamagotchiTests.swift
//  TamagotchiTests
//
//  Created by Barnham, Samuel (ABH) on 19/11/2019.
//  Copyright © 2019 Barnham, Samuel (ABH). All rights reserved.
//

import XCTest

class TamagotchiTests: XCTestCase {

    func testTamagotchiWithNoArgumentsReturnsNonNilObject() {
        //arrange
        let tamagotchi = Tamagotchi()
        //act
        //assert
        XCTAssertNotNil(Tamagotchi)
    }
}
