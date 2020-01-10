//
//  ViewController.swift
//  CarCustomizer
//
//  Created by Barnham, Samuel (ABH) on 10/01/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var carStatistics: UILabel!
    var car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, handling: 5, acceleration: 7.7)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        carStatistics.text = car.displayStats()
        
    }
    
}

