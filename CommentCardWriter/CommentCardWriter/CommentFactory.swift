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
        let comment = "I am \(enjoyment) \(subject) and I feel that I am working with good effort at a \(attainment) standard. In terms of areas to improve for next time, I believe that I could improve at \(areasToImprove)."
        return comment
    }
    
    
    
    
    
    
    
    
    
    
    
}
