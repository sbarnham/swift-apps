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
        XCTAssertEqual(tamagotchi.discipline, 100)
        XCTAssertEqual(tamagotchi.name, "")
        XCTAssertEqual(tamagotchi.age, 0)
        XCTAssertEqual(tamagotchi.happiness, 100)
        XCTAssertEqual(tamagotchi.weight, 0)
        XCTAssertEqual(tamagotchi.pooOnFloor, 0)
        XCTAssertEqual(tamagotchi.isIll, false)
    }
    
    func testTamagotchiDiesWhenAgeIs25() {
        let tamagotchi = Tamagotchi()
        let age = 25
        let death = tamagotchi.die(age: age, random: 0)
        XCTAssertEqual(death, true)
    }
    
    func testTamagotchiPoosWhenRandonNumberBelow200() {
        let tamagotchi = Tamagotchi()
        let random = 199
        tamagotchi.poo(random: random)
        let expected = 1
        XCTAssertEqual(tamagotchi.pooOnFloor, 1)
    }
    func testTamagotchiBecomesIllWhenRandonNumberAbove800DividedByPooOnFloor() {
        let tamagotchi = Tamagotchi()
        let random = 700
        let randomForPoo = 199
        tamagotchi.poo(random: randomForPoo)
        tamagotchi.ill(random: random, pooOnFloor: tamagotchi.pooOnFloor)
        let expected = true
        XCTAssertEqual(tamagotchi.isIll, true)
    }
    func testTamagotchiWithHealth6IncreasesHealthBy1AndWeightBy3WhenEatingMeal() {
        let tamagotchi = Tamagotchi()
        tamagotchi.health = 6
        tamagotchi.weight = 0
        tamagotchi.eatMeal()
        let expectedHealth = 7
        let expectedWeight = 3
        XCTAssertEqual(expectedHealth, tamagotchi.health)
        XCTAssertEqual(expectedWeight, tamagotchi.weight)
    }
    func testTamagotchiWithHealth3IncreasesHealthBy1AndWeightBy1WhenEatingSnack() {
        let tamagotchi = Tamagotchi()
        tamagotchi.health = 3
        tamagotchi.weight = 0
        tamagotchi.eatSnack()
        let expectedHealth = 4
        let expectedWeight = 1
        XCTAssertEqual(expectedHealth, tamagotchi.health)
        XCTAssertEqual(expectedWeight, tamagotchi.weight)
    }
    func testTamagotchiConsumesMedicineAndBecomesHealthy() {
        let tamagotchi = Tamagotchi()
        tamagotchi.isIll = true
        tamagotchi.consumeMedicine()
        XCTAssertEqual(tamagotchi.isIll, false)
    }
    func testTamagotchiIsNameable() {
        let tamagotchi = Tamagotchi()
        tamagotchi.naming(input: "Jeff")
        XCTAssertEqual(tamagotchi.name, "Jeff")
    }
    }

