//
//  Day15.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/8/20.
//

import UIKit
import Foundation


// MARK: - Learn essential Swift in one hour

// Creating constants and variables
var name = "Ted"
name = "Rebeca"

let user = "Daphne"
print(user)

// Strings
let actor = "Tom Cruise 🏃‍♂️"

let quote = "He tapped a sign saying \"Believe\" and walked away."

let movie = """
A day in
the life of an
Apple engineer
"""

print(actor.count)

print(quote.hasPrefix("He"))
print(quote.hasSuffix("Away."))


// Integers
let score = 10
let higherScore = score + 10
let halvedScore = score / 2

var counter = 10
counter += 5

let number = 120
print(number.isMultiple(of: 3))

let id = Int.random(in: 1...1000)

// Decimals
let scoreDecimal = 3.0

// Booleans
let goodDogs = true
let gameOver = false

var isSaved = false
isSaved.toggle()

// Joing strings
let name2 = "Taylor"
let age = 26
let message = "I'm \(name2) and I'm \(age) years old."
print(message)

// Arrays
var colors = ["Red", "Green", "Blue"]
let numbers = [4, 8, 15, 16]
var readings = [0.1, 0.5, 0.8]

print(colors[0])
print(readings[2])

colors.append("Tartan")

colors.remove(at: 0)
print(colors.count)
print(colors.contains("Octarine"))


// Dictionaries
let employee = [
    "name": "Taylor",
    "job": "Singer"
]

print(employee["name", default: "UNknown"])
print(employee["job", default: "UNknown"])


// Sets
var numbers2 = Set([1, 1, 3, 5, 7 ])
print(numbers2)

numbers2.insert(10)
numbers2.contains(10)
numbers2.contains(4)

// Enums
enum Weekday {
    case monday, tuseday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .friday


// Type annotations
var score2: Double = 0  // 沒有Double, score2 = 0 會被系統自動判別為Int

let player: String = "Roy"
var luckyNumber: Int = 13
let pi: Double = 3.1415926
var isEnabled: Bool = true
var albums: Array<String> = ["Red", "Fearless"]
var user2: Dictionary<String, String> = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation"])

var albums2: [String] = ["Red", "Fearless"]
var user3: [String: String] = ["id": "@twostraws"]

// empty arrays
var teams:[String] = [String]()
var clues = [String]()

enum UIstyle {
    case light, dark, system
}

var sytle: UIstyle = .light


// Conditions
let age2 = 16

if age2 < 12 {
    print("You can't vate")
} else if  age2 < 18 {
    print("You can vote soon")
} else {
    print("You can vote now.")
}

// &&:和 ; || ：或
let temp = 26

if temp > 20 && temp < 30 {
    print("It's a nice day.")
}

// Switch statements

enum Weather {
    case sun, rain, wind
}

let forecast = Weather.sun

switch forecast {
case .sun:
    print("A nice day.")
case .rain:
    print("Pack an umbrella.")
default:
    print("Should be okay.")
}


// Ternary conditional operator
let age3 = 18
let canVote = age3 >= 18 ? "Yes" : "No"

// Loop

//for
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works on \(os)")
}

for i in 1...12 {
    print("5 X \(i) = \( 5 * i)")
}

for i in 1..<13 {
    print("5 X \(i) = \( 5 * i)")
}

var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)

// while
var count = 10
while count > 0 {
    print("\(count)...")
    count -= 1
}
print("Go!")

// continue
let files = ["me.jpg", "work.txt", "sophie.jpg"]

for file in files {
    if file.hasSuffix(".jpg") == false {
        continue
    }
    
    print("Found picture: \(file)")
}

// founctions
func printTimeTables(number: Int) {
    for i in 1...12 {
        print("\(i) X \(number) = \(i * number)")
    }
}

printTimeTables(number: 5)

// function 只有一行code時,可省略return
func rollDice() -> Int {
    Int.random(in: 1...6)
}
let result = rollDice()
print(result)

// Returning multiple values from functions
func getUser() -> (firstName: String, lastName: String) {
    (firstName:"Taylor", lastName: "Swift")
}

let user4 = getUser()
print("Name: \(user4.firstName) \(user4.lastName)")

let(firstName,_) = getUser()
print("Name: \(firstName)")


// Customizing parameter labels
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result2 = isUppercase(string)


func printTimeTables(for number: Int) {
    for i in 1...12 {
        print("\(i) X \(number) = \(i * number)")
    }
}
printTimeTables(for: 5)


// Providing default values for parameters

func greet(_ person: String, formal: Bool = false) {
    if formal {
        print("Welcome, \(person)!")
    } else {
        print("Hi, \(person)!")
    }
}

greet("Tim", formal: true)
greet("Taylor")


// Handling errors in functions
enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 10 {
        return "OK"
    } else {
        return "Good"
    }
}

// When it comes to catching errors, you must always have a catch block that can handle every kind of error.
let string2 = "12345"

do {
    let result = try checkPassword(string2)
    print("Rating: \(result)")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error")
}


// Closures
let sayHello = {
    print("Hi there!")
}

sayHello()

let sayHello2 = { (name: String) -> String in
    "Hi \(name) !"
    
}
sayHello2("Jeff")

let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]

let onlyT = team.filter({ (name: String) -> Bool in
    return name.hasPrefix("T")
})

// Trailing closures and shorthand syntax
let onlyT2 = team.filter{ $0.hasPrefix("T") }
print(onlyT2)


// Structs
struct Album {
    let title: String
    let artist: String
    var isReleased = true
    
    func printSummary() {
        print("\(title) by \(artist)")
    }
    
    mutating func removeFromSale() {
        isReleased = false
    }
}

let red = Album(title: "Red", artist: "Taylor Swift")
print(red.title)
red.printSummary()

// Computed properties
struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var employeeA = Employee(name: "Jeff",vacationAllocated: 10, vacationTaken: 4)
employeeA.vacationTaken += 7
print(employeeA)
employeeA.vacationRemaining = 5
print(employeeA.vacationAllocated)


// Property observers
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}
 var game = Game()
game.score += 10
game.score -= 3

// Custom initializers
struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}
let player1 = Player(name: "Jeff")


// Access control
"""
* Use private for “don’t let anything outside the struct use this.”
* Use private(set) for “anything outside the struct can read this, but don’t let them change it.”
* Use fileprivate for “don’t let anything outside the current file use this.”
* Use public for “let anyone, anywhere use this.”
"""

struct BankAccount {
    private (set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
    
}
var myBankAccount = BankAccount()
myBankAccount.deposit(amount: 10000)
myBankAccount.withdraw(amount: 100)
print(myBankAccount.funds)


// Static properties and methods
struct AppData {
    static let version = "1.3 beta 2"
    static let settings = "settings.json"
}
AppData.version

// Class
"""
Classes let us create custom data types, and are different from structs in five ways."
"""
// we can create classes by inheriting functionality from other classes
class EmployeeB {
    let hours: Int
    
    init (hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: EmployeeB {
    func work() {
        print("I'm coding for \(hours) hours.")
    }
    override func printSummary() {
        print("I spend \(hours) hours a day searching Stack Overflow.")
    }
}


let novall = Developer(hours: 8)
novall.work()
novall.printSummary()


class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

// initializers are more tricky with classes.
class Car: Vehicle {
    let isConvertible: Bool
    
    init(isConvertible: Bool, isElectric: Bool ) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

// all copies of a class instance share their data, meaning that changes you make to one will automatically change other copies.
class Singer {
    var name = "Adele"
}

var singer1 = Singer()
var singer2 = singer1
singer2.name = "Justin"
print(singer1.name)
print(singer2.name)


// classes can have a deinitializer that gets called when the last reference to an object is destroyed.
class User {
    let id: Int
    
    init(id: Int){
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}

// classes let us change variable properties even when the class itself is constant
class UserA {
    var name = "Paul"
}

let user1 = UserA()
user1.name = "Taylor"
print(user1.name)

"""
As a result of this, classes don’t need the mutating keyword with methods that change their data.
"""


// Protocols
protocol VehicleA {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct CarA: VehicleA {
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)Km.")
    }
}


func commute(distance: Int, using vehicle: VehicleA) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("Too slow!")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = CarA()
commute(distance: 100, using: car)


protocol VehicleB {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct CarB: VehicleB {
    let name = "Car"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)Km.")
    }
}

"""
Tip: You can conform to as many protocols as you need, just by listing them separated with a comma.
"""

// Extensions
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

var quote2 = "   The truth is rarely pure and never simple   "
let trimed = quote2.trimmed()

extension String {
    mutating func trim() {
        self = self.trimmed()
    }
}

quote2.trim()

extension String {
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
"""

print(lyrics.lines.count)


// Protocol extensions
"""
 Array, Dictionary, and Set all conform to the Collection protocol
"""
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count:\(guests.count)")
}


// Optionals
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}


// Unwrapping optionals with guard
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    
    print("\(number) X \(number) = \(number * number)")
}
"""
Tip: You can use guard with any condition, including ones that don’t unwrap optionals.
"""


// Nil coalescing
let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

let input = ""
let number1 = Int(input) ?? 0
print(number1)


// Optional Chaining
let names = ["Arya", "Bran", "Robb", "Sana"]
let names2 = [String]()
let chosen = names.randomElement()?.uppercased()
let chosen2 = names2.randomElement()?.uppercased()
print("Next in line: \(chosen ?? "No One")")
print("Next in line: \(chosen2 ?? "No One")")


// Optional try?
enum UserError: Error {
    case badID, networkFaild
}

func getUser2(id: Int) throws -> String {
    throw UserError.networkFaild
}

if let userA = try? getUser2(id: 23) {
    print("User: \(userA)")
}
