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
    
    @IBOutlet var timeRemainingDisplay: UILabel!
    
    @IBOutlet var cycleCarsButton: UIButton!
    
    @IBOutlet var finishButton: UIButton!
    
    var i = 0
    var timeRemaining = 30 {
        didSet {
            timeRemainingDisplay.text = "\(timeRemaining)"
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        }
    }
    
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
    
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        car = starterCars.cars[i]
        remainingFunds = 1000
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        timeRemainingDisplay.text = "\(timeRemaining)"
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
        if remainingFunds < 700 && aerodynamicEnchancementSwitch.isOn == false {
            aerodynamicEnchancementSwitch.isEnabled = false
        }
        if remainingFunds < 500 {
            if engineAndExhaustPackageSwitch.isOn == false {
                engineAndExhaustPackageSwitch.isEnabled = false
            }
            if turboPackageSwitch.isOn == false {
                turboPackageSwitch.isEnabled = false
            }
        }
            if remainingFunds < 300 && tiresPackageSwitch.isOn == false {
                tiresPackageSwitch.isEnabled = false
        }
    }
    
    func finishAlert(title: String) {
        if title == "" {
            let title = "You have run out of time!"
        }
        let finish = UIAlertController(title: title, message: """
                Your finished car stats are:
                Make - \(car?.make ?? "")
                Model - \(car?.model ?? "")
                Top Speed - \(car?.topSpeed ?? 0)mph
                Acceleration - \(car?.acceleration ?? 0) seconds
                Handling - \(car?.handling ?? 0)
                Your remaining funds were: \(remainingFunds)
                """, preferredStyle:.alert)
        finish.addAction(UIAlertAction(title: "Next Car", style: .cancel, handler: {(action:UIAlertAction!) in
            self.cycleCars(0)
            self.cycleCarsButton.isEnabled = true
            self.finishButton.isEnabled = true
            self.timeRemaining = 30
        }))
        self.present(finish, animated: true)
    }
    
    @objc func countdown() {
        if timeRemaining > 0 {
            timeRemaining -= 1
            timeRemainingDisplay.text = "\(timeRemaining)"
        } else {
            timer?.invalidate()
            engineAndExhaustPackageSwitch.isEnabled = false
            turboPackageSwitch.isEnabled = false
            tiresPackageSwitch.isEnabled = false
            aerodynamicEnchancementSwitch.isEnabled = false
            cycleCarsButton.isEnabled = false
            finishButton.isEnabled = false
            finishAlert(title: "")
            
        }
    }
    
    @IBAction func finishButton(_ sender: Any) {
        engineAndExhaustPackageSwitch.isEnabled = false
        turboPackageSwitch.isEnabled = false
        tiresPackageSwitch.isEnabled = false
        aerodynamicEnchancementSwitch.isEnabled = false
        cycleCarsButton.isEnabled = false
        finishButton.isEnabled = false
        finishAlert(title: "User-initiated finish")
    }
}

