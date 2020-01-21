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
    
    @IBOutlet var userMessage: UILabel!
    
    var count = 0
    var overallFile = Tamagotchi()
    var pet : Tamagotchi?
    var timer: Timer?

        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pet = Tamagotchi.init()
        tamagotchiStatsDisplay.text = overallFile.displayStats()
        userMessage.text = ""
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerHandler), userInfo: nil, repeats: true)
        pooButton.isHidden = true
        illIcon.isHidden = true
    }

    @IBAction func feedMeal(_ sender: Any) {
        if pet!.hunger >= 10 {
            pet?.hunger -= 10
        } else {
            pet?.hunger -= pet?.hunger ?? 0
        }
        pet?.weight += 6
        if pet!.happiness <= 90 {
            pet?.happiness += 3
        }
        update()
    }
    
    
    @IBAction func feedSnack(_ sender: Any) {
        if pet!.hunger >= 2 {
            pet?.hunger -= 2
        } else {
            pet?.hunger -= pet?.hunger ?? 0
        }
        pet?.weight += 1
        if pet!.happiness <= 99 {
            pet?.happiness += 1
        }
        update()
    }
    
    @objc func timerHandler() {
        count += 1
        userMessage.text = ""
        let randomValue = Int.random(in: 0...100)
        if pet!.hunger > 20 {
            if randomValue < pet?.hunger ?? 0{
                pet?.health -= 1
            }
            pet?.weight -= 1
            userMessage.text = "Your tamagotchi is starving!"
        }
        if pet!.pooOnFloor > 0 {
            if randomValue < (3^(pet?.pooOnFloor ?? 0)) {
                pet?.isIll = true
                illIcon.isHidden = false
                userMessage.text = "Your tamagotchi has become ill!"
            }
        }
        if pet?.isIll == true {
            if randomValue < 50 {
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
            if randomValue > 60 {
                pet?.pooOnFloor += 1
                pooButton.isHidden = false
            }
        }
        if count % 3 == 0 {
            pet?.hunger += 1
        }
        if pet!.weight > 30 {
            if randomValue > 25 {
                pet?.happiness -= 10
            }
            userMessage.text = "Your tamagotchi is getting fat!"
        }
        die()
        update()
    }
    
    
    @IBAction func pooButton(_ sender: Any) {
        pet?.pooOnFloor = 0
        pooButton.isHidden = true
    }
    
    
    @IBAction func giveMedicine(_ sender: Any) {
        if pet!.isIll == true {
            pet?.isIll = false
            illIcon.isHidden = true
        } else {
            pet?.health -= 4
            userMessage.text = "Your tamagotchi just took a dangerous dose of medicine!"
        }
    }
    
    
    @IBAction func playGame(_ sender: Any) {
        let randomValue = Int.random(in: 0...100)
        if randomValue > 98 {
            timer?.invalidate()
            deathAlert(title: "\(pet?.name ?? "") died of an accident while playing a game!")
        } else if randomValue < 10 {
            pet?.isIll = true
        } else if randomValue > 25 && randomValue < 75 {
            pet?.happiness += 10
            pet?.discipline -= 25
        }
        userMessage.text = "Your tamagotchi played a game!"
    }
    
    
    @IBAction func discipline(_ sender: Any) {
        let randomValue = Int.random(in: 0...100)
        if randomValue > 70 {
            pet?.health -= 5
            userMessage.text = "Be careful! You hit your tamagotchi too hard"
        }
        if pet!.discipline == 100 {
            pet?.happiness -= 50
        }
        pet?.discipline += 20
        userMessage.text = "Your tamagotchi started behaving better..."
    }
    
    func die() {
        if pet!.age > 25 {
            timer?.invalidate()
            deathAlert(title: "\(pet?.name ?? "") died of old age!")
        }
        if pet!.happiness <= 0 {
            deathAlert(title: "\(pet?.name ?? "") got too sad and died!")
        }
        if pet!.discipline <= 0 {
            deathAlert(title: "\(pet?.name ?? "") misbehaved so badly that you gave him away!")
        }
        if pet!.health < 1 {
            timer?.invalidate()
            if pet?.isIll == true {
                deathAlert(title: "\(pet?.name ?? "") died of illness!")
            } else if pet!.hunger > 20 {
                deathAlert(title: "\(pet?.name ?? "") died of hunger!")
            } else if pet!.weight > 30 {
                deathAlert(title: "\(pet?.name ?? "") died of obesity!")
            } else {
                deathAlert(title: "\(pet?.name ?? "") died of an overdose!")
            }
        }
        
    }
    
    func deathAlert(title: String) {
        let death = UIAlertController(title: title, message: "Time elapsed (seconds): \(count)", preferredStyle: .alert)
        death.addAction(UIAlertAction(title: "New Tamagotchi", style: .cancel, handler: {(action:UIAlertAction!) in
            self.pet = Tamagotchi.init()
            self.tamagotchiStatsDisplay.text = self.overallFile.displayStats()
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerHandler), userInfo: nil, repeats: true)
            self.pooButton.isHidden = true
            self.illIcon.isHidden = true
        }))
        self.present(death, animated: true)
    }
    
    
    func update() {
        tamagotchiStatsDisplay.text = pet?.displayStats()
    }
    
}

