//
//  Day14.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/8/20.
//

import UIKit
import Foundation

// MARK: - How to handle missing data with optionals

// dictionary [String: String]
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}


var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}


var num1 = 1_000_000
var num2 = 0
var num3: Int? = nil

// str2 != str3  空的String 不等於 nil
var str1 = "Hello"
var str2 = ""
var str3: String? = nil

// arr2 != arr3  空的Array 不等於 nil
var arr1 = [0]
var arr2 = [Int]()
var arr3: [Int]? = nil


"""
As Zev Eisenberg said, “Swift didn’t introduce optionals. It introduced non-optionals.”
"""

// if you try to pass an optional integer into a function that requires a non-optional integer, like this:
func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil

//print(square(number: number))
"""
Swift will refuse to build that code, because the optional integer needs to be unwrapped – we can’t use an optional value where a non-optional is needed, because if there were no value inside we’d hit a problem.
"""

// unwrap
if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
}

// unwrap
if let number = number {
    print(square(number: number))
}

var weatherForecast: String? = "sunny"

if let forecast = weatherForecast {
    print("The Forecast is \(forecast)")
} else {
    print("No forecast available")
}


var bestScore: Int? = nil
bestScore = 101

if  bestScore! > 100 {
    print("You got a high score!")
} else {
    print("Better luck next time.")
}


// MARK: - How to unwrap optionals with guard

// guard let
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        
        // We *must* exit the function here
        return
    }
    
    // ˋnumberˋ is still available outside of ˋguardˋ
    print("\(number) X \(number) = \(number * number)")
}
"""

var myVar: Int? = 3

if let unwrapped = myVar {
// Run if myVar has a value inside
}

guard let unwrapped = myVar else {
 // Run if myVar doesn't have a value inside.
}

"""


"""
guard is designed exactly for this style of programming, and in fact does two things to help:

1. If you use guard to check a function’s inputs are valid, Swift will always require you to use return if the check fails.
2. If the check passes and the optional you’re unwrapping has a value inside, you can use it after the guard code finishes.
"""


"""
Tip: You can use guard with any condition, including ones that don’t unwrap optionals. For example, you might use
 ˋ guard someArray.isEmpty else { return } ˋ.
"""

// MARK: - How to unwrap optionals with nil coalescing

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"

let new2 = captains["Serenity", default: "N/A"]


let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"


struct Book {
    let title: String
    let author: String?
}
let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)


let input = ""
let number2 = Int(input) ?? 0
print(number2)



var conferenceName: String? = "WWDC"
var conference = conferenceName ?? nil

let distanceRan: Double? = 0.5
let distance: Double = distanceRan ?? 0

var userOptedIn: Bool? = nil
var optedIn = userOptedIn ?? false


// MARK: - How to handle multiple optionals using optional chaining

let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No One"
print("Next in line: \(chosen)")



struct Book2 {
    let title: String
    let author: String?
    
}

var book2: Book2? = nil
let author2 = book2?.author?.first?.uppercased() ?? "A"
print(author2)


let shoppingList = ["eggs", "tomatoes", "grapes"]
let firstItem = shoppingList.first?.appending(" are on my shopping list")


// MARK: - How to handle function failure with optionals

enum UserError: Error {
    case badId, networkFaild
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFaild
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user2 = (try? getUser(id: 23)) ?? "Anonymous"
print(user2)

"""
You’ll find ˊtry?ˊ is mainly used in three places:

1. In combination with guard let to exit the current function if the try? call returns nil.
2. In combination with nil coalescing to attempt something or provide a default value on failure.
3. When calling any throwing function without a return value, when you genuinely don’t care if it succeeded or not – maybe you’re writing to a log file or sending analytics to a server, for example.

"""

// MARK: - Summary: Optionals
"""
* Optionals let us represent the absence of data, which means we’re able to say “this integer has no value” – that’s different from a fixed number such as 0.

* As a result, everything that isn’t optional definitely has a value inside, even if that’s just an empty string.

* Unwrapping an optional is the process of looking inside a box to see what it contains: if there’s a value inside it’s sent back for use, otherwise there will be nil inside.

* We can use if let to run some code if the optional has a value, or guard let to run some code if the optional doesn’t have a value – but with guard we must always exit the function afterwards.

* The nil coalescing operator, ??, unwraps and returns an optional’s value, or uses a default value instead.

* Optional chaining lets us read an optional inside another optional with a convenient syntax.

* If a function might throw errors, you can convert it into an optional using try? – you’ll either get back the function’s return value, or nil if an error is thrown.

"""

// MARK: - Checkpoint 9

"""
Your challenge is this:
* write a function that accepts an optional array of integers, and returns one randomly.
* If the array is missing or empty, return a random number in the range 1 through 100.
* write your function in a single line of code.

"""

func pickNumber (of numbers: [Int]?) -> Int {
    return numbers?.randomElement() ?? Int.random(in: 1...100)
}

// test
let myEmptyNumbers = [Int]()
let myNumbers = [213, 234, 532, 13, 4, 213, 135]

let result = pickNumber(of: myEmptyNumbers)
print(result)

let result2 = pickNumber(of: myNumbers)
print(result2)

let result3 = pickNumber(of: nil)
print(result3)
