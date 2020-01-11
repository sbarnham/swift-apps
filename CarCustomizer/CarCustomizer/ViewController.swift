//
//  ViewController.swift
//  CarCustomizer
//
//  Created by Barnham, Samuel (ABH) on 10/01/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var aerodynamicEnchancementSwitch: UISwitch!
    
    @IBOutlet var turboPackageSwitch: UISwitch!
    
    @IBOutlet var remainingFundsDisplay: UILabel!
    
    @IBOutlet var engineAndExhaustPackageSwitch: UISwitch!
    
    @IBOutlet var tiresPackageSwitch: UISwitch!
    
    @IBOutlet weak var carStatistics: UILabel!
    
    var i = 0
    var remainingFunds = 0 {
        didSet {
            remainingFundsDisplay.text = "Remaining Funds: \(remainingFunds)"
        }
    }
    var starterCars = StarterCars()
    var car: Car? {
        didSet {
            carStatistics.text = car?.displayStats()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        car = starterCars.cars[i]
        remainingFunds = 1000
    }
    
    @IBAction func cycleCars(_ sender: Any) {
        i += 1
        if i == starterCars.cars.count {
            i = 0
        }
        car = starterCars.cars[i]
        remainingFunds = 1000
        checkFunds()
        engineAndExhaustPackageSwitch.isOn = false
        tiresPackageSwitch.isOn = false
        turboPackageSwitch.isOn = false
        aerodynamicEnchancementSwitch.isOn = false
    }
    
    
    @IBAction func engineAndExhaustToggle(_ sender: Any) {
        if engineAndExhaustPackageSwitch.isOn {
            car?.topSpeed += 5
            remainingFunds -= 400
        } else {
            car?.topSpeed -= 5
            remainingFunds += 400
        }
        checkFunds()
    }
    
    @IBAction func tiresToggle(_ sender: Any) {
        if tiresPackageSwitch.isOn {
            car?.handling += 2
            remainingFunds -= 300
        } else {
            car?.handling -= 2
            remainingFunds += 300
        }
        checkFunds()
    }

    @IBAction func turboToggle(_ sender: Any) {
        if turboPackageSwitch.isOn {
            car?.acceleration -= 1.0
            car?.topSpeed -= 3
            remainingFunds -= 500
        } else {
            car?.acceleration += 1.0
            car?.topSpeed += 3
            remainingFunds += 500
        }
        checkFunds()
    }

    @IBAction func aerodynamicEnchancementToggle(_ sender: Any) {
        if aerodynamicEnchancementSwitch.isOn {
            car?.topSpeed += 15
            car?.handling -= 1
            remainingFunds -= 700
        } else {
            car?.topSpeed -= 15
            car?.handling += 1
            remainingFunds += 700
        }
        checkFunds()
    }
    
    func checkFunds() {
        aerodynamicEnchancementSwitch.isEnabled = true
        engineAndExhaustPackageSwitch.isEnabled = true
        turboPackageSwitch.isEnabled = true
        tiresPackageSwitch.isEnabled = true
        if remainingFunds < 700 {
            aerodynamicEnchancementSwitch.isEnabled = false
        if remainingFunds < 500 {
            engineAndExhaustPackageSwitch.isEnabled = false
            turboPackageSwitch.isEnabled = false
        }
        if remainingFunds < 300 {
            tiresPackageSwitch.isEnabled = false
        }
    }

}
}
