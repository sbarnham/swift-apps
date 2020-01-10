//
//  Car.swift
//  CarCustomizer
//
//  Created by Barnham, Samuel (ABH) on 10/01/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import Foundation

struct Car {
    var make: String
    var model: String
    var topSpeed: Int
    var handling: Int
    var acceleration: Double
    
    func displayStats() -> String {
        return """
            Make - \(make)
            Model - \(model)
            Top Speed - \(topSpeed)mph
            Acceleration - \(acceleration) seconds
            Handling - \(handling)
        """
    }
}
