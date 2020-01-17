//
//  ViewController.swift
//  TamagotchiApp
//
//  Created by Barnham, Samuel (ABH) on 14/01/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tamagotchiStatsDisplay: UILabel!
    
    @IBOutlet var pooButton: UIButton!
    
    @IBOutlet var illIcon: UIButton!
    
    var count = 0
    var overallFile = Tamagotchi()
    var pet : Tamagotchi?
    var timer: Timer?

        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pet = Tamagotchi.init()
        tamagotchiStatsDisplay.text = overallFile.displayStats()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerHandler), userInfo: nil, repeats: true)
        pooButton.isHidden = true
        illIcon.isHidden = true
    }

    @IBAction func feedMeal(_ sender: Any) {
        pet?.hunger -= 10
        pet?.weight += 3
        update()
    }
    
    
    @IBAction func feedSnack(_ sender: Any) {
        pet?.hunger -= 2
        pet?.weight += 1
        update()
    }
    
    @objc func timerHandler() {
        count += 1
        let randomValue = Int.random(in: 0...100)
        if pet!.hunger > 20 {
            if randomValue < pet?.hunger ?? 0 {
                pet?.health -= 1
            }
        }
        if pet!.pooOnFloor > 0 {
            if randomValue < (3^(pet?.pooOnFloor ?? 0)) {
                pet?.isIll = true
                illIcon.isHidden = false
            }
        }
        if pet?.isIll == true {
            if randomValue < 25 {
                pet?.health -= 1
            }
        }
        if count % 60 == 0 {
            pet?.age += 1
            if pet!.pooOnFloor > 0 {
                pet?.health -= 3
            }
        }
        if count % 10 == 0 {
            if randomValue > 75 {
                pet?.pooOnFloor += 1
                pooButton.isHidden = false
            }
        }
        if count % 3 == 0 {
            pet?.hunger += 1
        }
        update()
    }
    
    
    @IBAction func pooButton(_ sender: Any) {
        pet?.pooOnFloor -= 1
        pooButton.isHidden = true
    }
    
    
    @IBAction func giveMedicine(_ sender: Any) {
        if pet!.isIll == true {
            pet?.isIll = false
            illIcon.isHidden = true
        } else {
            pet?.health -= 4
        }
    }
    
    //func die() {
        
    //}
    
    func update() {
        tamagotchiStatsDisplay.text = pet?.displayStats()
    }
    
}

