//
//  Absence.swift
//  AbsenceRecorder
//
//  Created by Barnham, Samuel (ABH) on 06/02/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import Foundation

class Absence {
    var takenOn: Date
    var absent : [Student] = []
    var selectedRows: [IndexPath]?
    
    init(date: Date) {
        takenOn = date
    }
}
