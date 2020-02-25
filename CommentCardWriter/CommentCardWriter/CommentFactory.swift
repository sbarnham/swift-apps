//
//  CommentFactory.swift
//  CommentCardWriter
//
//  Created by Barnham, Samuel (ABH) on 11/02/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import Foundation

class CommentFactory {
    static func createComment(subject: String, enjoyment: String, areasToImprove: String, attainment: String) -> String {
        var neatEnjoyment = enjoyment.lowercased()
        neatEnjoyment.removeLast(3)
        let comment = "I am \(neatEnjoyment) \(subject) and I feel that I am working at a \(attainment.lowercased()) standard. In terms of areas to improve for the next term, I believe that I could improve in the following areas: \(areasToImprove)."
        return comment
    }
    
    
    
    
    
    
    
    
    
    
    
}
