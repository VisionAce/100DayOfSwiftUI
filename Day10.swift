//
//  Day10.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/8/14.
//

import UIKit
import Foundation


// How to create your own structs

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) ( \(year) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()



struct Employee {
    let name: String
    var vacationRemaining = 14
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remainig.")
        }
    }
}

var archer = Employee(name: "Stering Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

"""
專有名詞： properties, methods, instances, initializer

* Variables and constants that belong to structs are called properties.
* Functions that belong to structs are called methods.
* When we create a constant or variable out of a struct, we call that an instance – you might create a dozen unique instances of the Album struct, for example.
* When we create instances of structs we do so using an initializer like this: Album(title: "Wings", artist: "BTS", year: 2016).
"""

// syntactic sugar: 以下兩行code等效
var archer1 = Employee(name: "Stering Archer", vacationRemaining: 14)
var archer2 = Employee.init(name: "Stering Archer", vacationRemaining: 14)

let a = 1
let b = 2.0
let c = Double(a) + b // Swift’s own Double type is implemented as a struct, and has an initializer function that accepts an integer.

// Swift is intelligent in the way it generates its initializer, even inserting default values if we assign them to our properties.
let kane = Employee(name: "Lana Kane")
print(kane)
let poovey = Employee(name: "Pam Poovey", vacationRemaining: 35)
print(poovey)



// How to compute property values dynamically
struct Employee2 {
    let name: String
    var vacationRemaining: Int
}

var archer3 = Employee2(name: "Stering Archer", vacationRemaining: 14)
archer3.vacationRemaining -= 5
print(archer3.vacationRemaining)
archer3.vacationRemaining -= 3
print(archer3.vacationRemaining)



struct Employee3 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        vacationAllocated - vacationTaken
    }
}

var archer4 = Employee3(name: "Stering Archer", vacationAllocated: 14)
archer4.vacationTaken += 4
print(archer4.vacationRemaining)
archer4.vacationTaken += 4
print(archer4.vacationRemaining)


// get , set
struct Employee4 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue // that’s automatically provided to us by Swift, and stores whatever value the user was trying to assign to the property.
        }
    }
}

var archer5 = Employee4(name: "Stering Archer", vacationAllocated: 14)
archer5.vacationTaken += 7
print(archer5.vacationAllocated)
archer5.vacationRemaining = 10
print(archer5.vacationAllocated)


// How to take action when a property changes

struct Game {
    var score = 0
}

var game = Game()
game.score += 10
print("Score is now \(game.score)")
game.score -= 3
print("Score is now \(game.score)")
game.score += 1
print("Score is now \(game.score)")

print()

// didset
struct Game2 {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game2 = Game2()
game2.score += 10
game2.score -= 3
game2.score += 1


// oldValue, didSet, willSet

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }
        
        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")



struct Dog {
    var age = 0 {
        didSet {
            let dogAge = age * 7
            print("I'm now \(dogAge) in dog years.")
        }
    }
}
var dog = Dog()
dog.age = 5
dog.age = 9


// How to create custom initializers
"""
one golden rule: all properties must have a value by the time the initializer ends.

"""
struct Player {
    let name: String
    let number: Int
}

let player = Player(name: "Megan R", number: 15)



"""
1. There is no func keyword. Yes, this looks like a function in terms of its syntax, but Swift treats initializers specially.
2. Even though this creates a new Player instance, initializers never explicitly have a return type – they always return the type of data they belong to.
3. I’ve used self to assign parameters to properties to clarify we mean “assign the name parameter to my name property”.

"""

struct Player2 {
    let name: String
    let number: Int
    
    init (name: String, number: Int) {
        self.name = name
        self.number = number
    }
}

struct Player3 {
    let name: String
    let number: Int
    
    init (name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player2 = Player3(name: "Megan R")
print(player2.number)




struct Tree {
    var type: String
    var hasFruit: Bool
    
    init() {
        type = "Cherry"
        hasFruit = true
    }
}

let cherryTree = Tree()
print(cherryTree)


struct Starship {
    var name: String
    var maxWarp: Double
    init(StarshipName: String, maxWarp: Double) {
        name = StarshipName
        self.maxWarp = maxWarp
    }
}
let voyager = Starship(StarshipName: "Voyager", maxWarp: 2.0)
print(voyager)
