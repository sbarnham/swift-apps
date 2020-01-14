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
    
    var overallFile = Tamagotchi()
    var pet : Tamagotchi?

        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pet = Tamagotchi.init()
        tamagotchiStatsDisplay.text = overallFile.displayStats()
    }

    @IBAction func feedMeal(_ sender: Any) {
        if pet!.health < 8 {
            pet?.health += 1
        }
        pet?.weight += 3
        update()
    }
    
    func update() {
        tamagotchiStatsDisplay.text = overallFile.displayStats()
    }
    
}

