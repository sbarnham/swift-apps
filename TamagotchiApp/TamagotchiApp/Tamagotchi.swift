//
//  Tamagotchi.swift
//  TamagotchiApp
//
//  Created by Barnham, Samuel (ABH) on 14/01/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import Foundation

class Tamagotchi {
    public var health: Int = 10
    var discipline: Int = 100
    var name: String
    var age: Int = 0
    var happiness: Int = 100
    var weight: Int = 0
    var pooOnFloor: Int = 0
    var isIll: Bool = false
    var hunger: Int = 0
    
    let names = ["Jeff", "Bob", "Steve", "Alex", "Albert", "Bloke"]
    
    init() {
        let index = Int.random(in: 0...3)
        name = names[index]
    }
    
    func die(age: Int, random: Int) -> Bool {
        if age == 25 {
            return true
        } else if random > 998 {
            return true
        } else {
            return false
        }
    }
    
    func poo(random: Int) {
        if random < 200 {
            pooOnFloor += 1
        }
    }
    
    func ill(random: Int, pooOnFloor: Int) {
        if random > (800/(pooOnFloor + 1)) {
            isIll = true
        }
    }
    
    func eatMeal() {
        if health < 8 {
            health += 1
        }
        weight += 3
    }
    
    func eatSnack() {
        if health < 5 {
            health += 1
        }
        weight += 1
    }
    
    func consumeMedicine() {
        isIll = false
    }
    
    func decreaseDiscipline(random: Int) {
        if random < 400 {
            discipline -= 25
        } else if random < 50 {
            discipline -= 75
        }
    }
    
    func disciplineTamagotchi() {
        discipline += 25
        happiness -= 25
    }
    
    func sleep() {
        age += 1
    }
    
    func displayStats() -> String{
        return """
            Name - \(name)
            Age - \(age)
            Health - \(health)
            Hunger - \(hunger)
            Happiness - \(happiness)
            Discipline - \(discipline)
            Weight - \(weight)
        """
    }
    
}
