//
//  UserDocumentManager.swift
//  AbsenceRecorder
//
//  Created by Barnham, Samuel (ABH) on 09/03/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import Foundation

class UserDocumentManager {
    static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}
