//
//  Division.swift
//  AbsenceRecorder
//
//  Created by Barnham, Samuel (ABH) on 30/01/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import Foundation

class Division {
    let code: String
    var students: [Student] = []
    var absences: [Absence] = []
    
    init(code: String) {
        self.code = code
    }
    
    func getAbsence(for date: Date) -> Absence? {
        return absences.last(where: { $0.takenOn == date })
     }
    
}
