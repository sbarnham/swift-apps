//
//  DivisionTests.swift
//  AbsenceRecorderTests
//
//  Created by Barnham, Samuel (ABH) on 09/03/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import XCTest

class DivisionTests: XCTestCase {
        func testGetAbsenceWithCurrentDateRetrievesExisitngAbsenceOnSameDay() {
            //arrange
            let division = Division(code: "TestDiv")
            let absence = Absence(date: Date())
            division.absences.append(absence)
            let dateLaterToday = Date(timeIntervalSinceNow: 100)
            //act
            let actual = division.getAbsence(for: dateLaterToday)
            //assert
            XCTAssertNotNil(actual)
        }

    }


