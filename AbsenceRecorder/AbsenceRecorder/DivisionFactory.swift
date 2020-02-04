//
//  DivisionFactory.swift
//  AbsenceRecorder
//
//  Created by Barnham, Samuel (ABH) on 30/01/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import Foundation

class DivisionFactory {
    static func createDivision(code: String, of size: Int) -> Division {
        let division = Division(code: code)
        for i in 1...size {
            division.students.append(Student(forename: "Student", surname: "\(i)", birthday: Date()))
        }
        return division
    }
}
