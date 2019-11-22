//
//  TamagotchiTests.swift
//  TamagotchiTests
//
//  Created by Barnham, Samuel (ABH) on 19/11/2019.
//  Copyright © 2019 Barnham, Samuel (ABH). All rights reserved.
//

import XCTest

class TamagotchiTest: XCTestCase {

    func testTamagotchiWithNoArgumentsReturnsNonNilObjectAndAllAttributesSetToDefaultValues() {
        //arrange
        let tamagotchi = Tamagotchi()
        //act
        //assert
        XCTAssertNotNil(tamagotchi)
        XCTAssertEqual(tamagotchi.health, 10)
        XCTAssertEqual(tamagotchi.discipline, 0)
        XCTAssertEqual(tamagotchi.name, "")
        XCTAssertEqual(tamagotchi.age, 0)
        XCTAssertEqual(tamagotchi.happiness, 0)
        XCTAssertEqual(tamagotchi.weight, 0)
        XCTAssertEqual(tamagotchi.pooOnFloor, 0)
        XCTAssertEqual(tamagotchi.isIll, false)
    }
}
