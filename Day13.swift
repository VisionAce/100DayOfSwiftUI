//
//  Day13.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/8/18.
//

import UIKit
import Foundation


// MARK: - How to create and use protocols

protocol Vehicle {
    var name: String { get }
    var currentPassenger: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    let name = "Car"
    var currentPassenger = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    func travel(distance: Int) {
        print("I'm driving \(distance)Km")
    }
    
    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassenger = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    func travel(distance: Int) {
        print("I'm cycling \(distance)Km")
    }

}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a dfferent vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles:[Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)Km")
    }
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car, bike], distance: 150)

// in protocol: It's not possible to create set-only properties in Swift.

//protocol Buildable {
//    var numberOfBricks: Int { set }
//    var materials:[String] { get set }
//}


// MARK: - How to use opaque return types

func getRandomNumber() -> Int {
    Int.random(in: 1...6)
}

func getRandomBool() -> Bool {
    Bool.random()
}


// Both Int and Bool conform to a common Swift protocol called Equatable, which means “can be compared for equality.” The Equatable protocol is what allows us to use ==, like this:
print(getRandomNumber() == getRandomNumber())


func getRandomNumber2() -> some Equatable {
    Double.random(in: 1...6)
}

func getRandomBool2() -> some Equatable {
    Bool.random()
}

print(getRandomNumber2() == getRandomNumber2())

"""
opaque 不明類型：
此類型在App的project很多
例如： some view
我們有很多不同類型的view，就算同一種view,例如ScrollView,在每一個modifier進行樣式的調整後,該view的類型都會一直變化,且越來越長,所以我們無須特意清出地寫出此類型的型別,可用 some view來替代,Swift很聰明地就能判斷自己的類型是啥,這樣的好處是由系統來判別類型,而我們只要著重在功能上的應用或code的完善。

"""

// MARK: - How to create and use extensions

var quote = "   The truth is rarely pure and never simple.   "
print(quote)

let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
print(trimmed)

extension String {
    var line: [String] {
        self.components(separatedBy: .newlines)
    }
    
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
}

let trimmed2 = quote.trimmed()
print(trimmed2)

func trim(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}

let trimmed3 = trim(quote)

"""
the extension has a number of benefits over the global function, including:

1. When you type quote. Xcode brings up a list of methods on the string, including all the ones we add in extensions. This makes our extra functionality easy to find.
2. Writing global functions makes your code rather messy – they are hard to organize and hard to keep track of. On the other hand, extensions are naturally grouped by the data type they are extending.
3. Because your extension methods are a full part of the original type, they get full access to the type’s internal data. That means they can use properties and methods marked with private access control, for example.

"""

quote.trim()

"""
命名原則：
Notice how the method has slightly different naming now:

1. when we modified the string directly we used trim().
2. you’re returning a new value rather than changing it in place, you should use word endings like ed or ing, like reversed().
"""

"""
You can also use extensions to add properties to types, but there is one rule:
they must only be computed properties, not stored properties.
不能是stored properties的原因：會佔據很多記憶體儲存的空間
"""


let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""
print(lyrics.line.count)


// 想要讓struct在實例中保有memberwise initializer 和 自定義的初始值時,可以用extension解決
struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount:Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}


// 如果不用extension時,會報錯Extra argument 'readingHours' in call
let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)

let lotr2 = Book(title: "Lord of the Rings 2", pageCount: 2000)

print(lotr)
print(lotr2)


extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

57.isEven

extension Int {
    func times(_ action: ()-> Void) {
        for _ in 0..<self {
            action()
        }
    }
}

func abc () {
    print("abc")
}

3.times(abc)


extension Int {
    func clamped(min: Int, max: Int) -> Int {
        if(self > max) {
            return max
        } else if (self < min) {
            return min
        }
        return self
    }
}

1.clamped(min: 2, max: 4)


extension Int {
    var isAnswerToLifeUniverseAndEverything: Bool {
        self == 42
    }
}

42.isAnswerToLifeUniverseAndEverything


// MARK: - How to create and use protocol extensions

"""
 Array, Set, and Dictionary all conform to a built-in protocol called Collection
"""

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}


protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

// MARK: - Summary: Protocols and extensions

"""
* Protocols are like contracts for code: we specify the functions and methods that we required, and conforming types must implement them.
* Opaque return types let us hide some information in our code. That might mean we want to retain flexibility to change in the future, but also means we don’t need to write out gigantic return types.
* Extensions let us add functionality to our own custom types, or to Swift’s built-in types. This might mean adding a method, but we can also add computed properties.
* Protocol extensions let us add functionality to many types all at once – we can add properties and methods to a protocol, and all conforming types get access to them.

"""

// MARK: - Checkpoint 8

"""
Your challenge is this: make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it. Your protocol should require the following:

* A property storing how many rooms it has.
* A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
* A property storing the name of the estate agent responsible for selling the building.
* A method for printing the sales summary of the building, describing what it is along with its other properties.

"""

protocol Building {
    var rooms: Int { get }
    var cost: Int { get set }
    var agent: String { get set }
    func onsale ()
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var agent: String
    
    func onsale() {
        print("There are \(rooms) rooms in this house.")
        print("Transaction pricr: $ \(cost)")
        print("Real estate agent: \(agent)")
    }
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var agent: String
    
    func onsale() {
        print("There are \(rooms) rooms in this Office.")
        print("Transaction pricr: $ \(cost)")
        print("Real estate agent: \(agent)")
    }
}




let house = House(rooms: 4, cost: 1000_000_000 , agent: "Jeff")
house.onsale()

let office = Office(rooms: 2, cost: 400_000_000, agent: "Taylor")
office.onsale()



print()
// 其他參考解答

protocol Building2 {
    var rooms: Int { get }
    var price: Int { get }
    var agent: String { get }
    func salesSummary()
}


struct House2: Building2 {
    var rooms: Int
    var price: Int
    var agent: String

    func salesSummary() {
        print("Here we have a beautiful House with \(rooms) rooms. The price will be \(price) Dollars and your agent is \(agent)")
    }
}

extension House2 {
    init(rooms: Int, agent: String) {
        self.rooms = rooms
        self.price = rooms * 50_000
        self.agent = agent
    }
}


// I changed the Office struct to make rooms a computed property. This still satisfies the protocol. Because you can certainly GET the value of rooms (the contract), but you cannot write a value for rooms.
struct Office2: Building2 {
    var rooms: Int { // Number of rooms is computed based on number of seats in the office building.
            seats / 2     // Example only.  Each office contains 2 seats.
        }
    var seats: Int  // added this variable to report number of seats in the office building.
    var price: Int
    var agent: String

    func salesSummary() {
        print("Here we have a beautiful building with \(seats) seats in \(rooms) offices. The price will be \(price) Dollars and your agent is \(agent)")
    }
}

let house2 = House2(rooms: 6, price: 150_000, agent: "Maxi")
house2.salesSummary()

let office2 = Office2(seats: 10, price: 400_000, agent: "Maxi")
office2.salesSummary()

let extHoues = House2(rooms: 5, agent: "Maxi")
extHoues.salesSummary()
