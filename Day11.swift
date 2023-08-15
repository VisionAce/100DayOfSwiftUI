//
//  Day11.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/8/15.
//

import UIKit
import Foundation

// MARK: - How to limit access to internal data using access control

struct BankAccount {
    var funds = 0
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

account.funds -= 1000
print(account.funds)


// access control
struct BankAccount2 {
    private(set) var funds = 0
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account2 = BankAccount2()
account2.deposit(amount: 100)
"""
Left side of mutating operator isn't mutable: 'funds' setter is inaccessible
"""
//account2.funds -= 1000
print(account2.funds)


"""
private, fileprivate, public, private(set)

Swift provides us with several options, but when you’re learning you’ll only need a handful:

* Use private for “don’t let anything outside the struct use this.”
* Use fileprivate for “don’t let anything outside the current file use this.”
* Use public for “let anyone, anywhere use this.”
* Use private(set)   This means “let anyone read this property, but only let my methods write it.”
"""


struct FaceBookUser {
    private var privatePosts: [String]
    var publicPosts: [String]
}
"""
'FaceBookUser' initializer is inaccessible due to 'private' protection level
"""

//let user = FaceBookUser(privatePosts: ["Hello Taylor!"], publicPosts: ["Hello!"])


struct Person {
    private var socialSecurityNumber: String
    init (ssn: String) {
        socialSecurityNumber = ssn
    }
}

let sarah = Person(ssn: "555-55-5555")


struct Doctor {
    var name: String
    var location: String
    private var currentPatient = "no one"
    
    init (name:String, location:String, cP: String) {
        self.name = name
        self.location = location
        currentPatient = cP
    }
}

let drJones = Doctor(name: "Esther Jones", location: "Bristol",cP: "asdsa")

struct School {
    var staffNames:[String]
    private var studentNames: [String]
    init (staff: [String]) {
        self.staffNames = staff
        self.studentNames = [String]()
    }
}

let royalHigh = School(staff: ["Mrs Hughes"])


// MARK: - Static properties and methods

struct School2 {
    static var studentCount = 0
    
    static func add(student: String) {  // 這裡不用mutating是因為這是靜態屬性的function所以當在外部呼叫此function,只會改動School2的相關內容,並且靜態屬性只有其本身自己,沒有其他實例。
        print("\(student) joined the school.")
        studentCount += 1
        
    }
}
School2.add(student: "Taylor Swift")
print(School2.studentCount)


"""
If you want to mix and match static and non-static properties and methods, there are two rules:

1. To access non-static code from static code… you’re out of luck: static properties and methods can’t refer to non-static properties and methods because it just doesn’t make sense – which instance of School would you be referring to?
2. To access static code from non-static code, always use your type’s name such as School.studentCount. You can also use Self to refer to the current type.

"""

"""
self vs Self

* self refers to the current value of the struct.
* Self refers to the current type.

記憶法：Self 大寫的S和資料型別的開頭字母同為大寫(Swift的命名方式)。例如：Int, Double, String…

"""

// static 使用時機
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFileName = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}
AppData.version


struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "cfederighi", password: "h4irf0rce0ne")
}
// 如果要在previews顯示Employee的實例的使用,就可以用Employee.example
Employee.example

struct NewStory {
    static var breakingNewsCount = 0
    static var regularNewsCount = 0
    var headline: String
    init (headline: String, isBreaking: Bool) {
        self.headline = headline
        if isBreaking {
            NewStory.breakingNewsCount += 1
        } else {
            NewStory.regularNewsCount += 1
        }
    }
}
print()

// MARK: - Checkpoint 6

"""
* create a struct to store information about a car, including:
   its model
   number of seats
   current gear

* add a method to change gears up or down.
* Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?
* Don't allow invalid gears- 1...10 seems a fair maximum range.
"""


struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear = 1 {
        didSet {
            currentGear = min(max(currentGear, 1), 10)
        }
    }
    
    mutating func changeGear (needUpGear: Bool, needDownGear: Bool) {
        
        if needUpGear && needDownGear == false {
            self.currentGear += 1
        } else if needDownGear && needUpGear == false {
            self.currentGear -= 1
        } else {
            print("no need to change gear")
        }
        print("\(model) current Gear: \(currentGear)")
        print()
    }
}
// 測試:
var car = Car(model: "BMW", numberOfSeats: 4,currentGear: 1)
car.changeGear(needUpGear: true, needDownGear: false)
car.changeGear(needUpGear: false, needDownGear: true)
car.changeGear(needUpGear: false, needDownGear: false)
car.changeGear(needUpGear: true, needDownGear: true)

for _ in 1...15 {
    car.changeGear(needUpGear: true, needDownGear: false)
}

for _ in 1...15 {
    car.changeGear(needUpGear: false, needDownGear: true)
}



// MARK: - 參考解答

struct Car2 {
    let model: String     // constant! probably won't change
    let seatCount: Int    // same!
    private(set) var currentGear = 1  // only change via an internal method.

    enum GearDirection {
        case up, down, neutral
    }

    public mutating func changeGear(_ direction: GearDirection) {
        switch direction {
        case .down : currentGear -= 1
            if currentGear < 1 {currentGear = 1}
        case .up :   currentGear += 1
            if currentGear > 10 { currentGear = 10 }
        case .neutral:
            currentGear = 1  // arbitrary selection
        }
        print("The \(model) is in gear: \(currentGear)")
    }
}

// Test Code
var prefect = Car2(model: "Ford Prefect", seatCount: 4, currentGear: 3)
prefect.changeGear(.up)
prefect.changeGear(.neutral) // Jump right to Gear 1.
prefect.changeGear(.down)  // try this line a couple of times. try to get below zero.

