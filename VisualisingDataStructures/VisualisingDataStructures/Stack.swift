//
//  Stack.swift
//  VisualisingDataStructures
//
//  Created by Barnham, Samuel (ABH) on 28/01/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import Foundation

class Stack {
    var values : [String] = ["","","","","","","","","",""]
    var top: Int = -1
    
    
    func push(item: String) {
        if top < values.count - 1 {
            top += 1
            values[top] = item
        }
    }
    
    func pop() -> String {
        if top != -1 {
            let value = values[top]
            top -= 1
            return value
        }
        return ""
    }
    
    func peek() -> String {
        return values[top]
    }
    
    func display() -> [String] {
        return values
    }
    
}
