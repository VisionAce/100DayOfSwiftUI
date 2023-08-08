//
//  Day1.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/8/8.
//

import Foundation

var greeting = "Hello, playground"


var playerName = "Jeff"

print(playerName)

playerName = "Alex"
print(playerName)

playerName = "Amy"
print(playerName)

let actor = "Denzel Washington"
let quote = "Then he tapped a sign saying \"Believe\" and walked away"
let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"

let movie = """
A day in
the life of an
Apple engineer
"""

let nameLength = actor.count
print(nameLength)
print(result.uppercased())

print(movie.hasPrefix("A day"))
print(filename.hasSuffix(".jpg"))


//How to store whole numbers
let score = 10

let reallyBig = 10_0_00_00_0_0_00
let lowerScore = score - 2
let higerScore = score + 10
let doubleedScore = score * 2
let squredScore = score * score
let halvedScore = score / 2
print(score)

var counter = 10
counter += 5
print(counter)
counter *= 2
print(counter)
counter -= 10
print(counter)
counter /= 2
print(counter)

let number = 120
print(number.isMultiple(of: 9))
print(120.isMultiple(of: 40))//120 = 40 * 3



//How to store decimal numbers
let decimalNumber = 0.1 + 0.2
print(decimalNumber)

let a = 1
let b = 2.0
//let c = a + b
let cInt = a + Int(b)
let cDouble = Double(a) + b

let double1 = 3.1
let double2 = 3213213.213213
let double3 = 3.0
let int1 = 3

var rating = 5.0
rating *= 2

let aDeciamal = 1.0/3.0
print(aDeciamal)
let stringADeciamal = String(format: "%.2f", aDeciamal)
print(stringADeciamal)

let aInt = 1/3
print(aInt)

