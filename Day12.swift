//
//  Day12.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/8/17.
//

import UIKit
import Foundation

// MARK: - How to create your own classes

"""
classes differ from structs in five key places:

1. You can make one class build upon functionality in another class, gaining all its properties and methods as a starting point. If you want to selectively override some methods, you can do that too.
2. Because of that first point, Swift won’t automatically generate a memberwise initializer for classes. This means you either need to write your own initializer, or assign default values to all your properties.
3. When you copy an instance of a class, both copies share the same data – if you change one copy, the other one also changes.
4.When the final copy of a class instance is destroyed, Swift can optionally run a special function called a deinitializer.
5.Even if you make a class constant, you can still change its properties as long as they are variables.

"""

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10


// MARK: - How to make one class inherit from another

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()


let novall = Developer(hours: 8)
novall.printSummary()

"""
override :

This is where Swift enforces a simple rule: if a child class wants to change a method from a parent class, you must use override in the child class’s version. This does two things:

1. If you attempt to change a method without using override, Swift will refuse to build your code. This stops you accidentally overriding a method.
2. If you use override but your method doesn’t actually override something from the parent class, Swift will refuse to build your code because you probably made a mistake.

"""

class Developer2: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}
let jeff = Developer2(hours: 4)
jeff.printSummary()


"""
final :

* If you know for sure that your class should not support inheritance, you can mark it as final.
This means the class itself can inherit from other things, but can’t be used to inherit from – no child class can use a final class as its parent.

"""

// MARK: - How to add initializers for classes
class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
    
}

let teslaX = Car(isElectric: true, isConvertible: false)


// If a subclass does not have any of its own initializers, it automatically inherits the initializers of its parent class.
class Car2: Vehicle {
    let isConvertible = false
}

let teslaX2 = Car2(isElectric: true)



class Food {
    var name: String
    var nutritionRating: Int
    init(name: String, nutritionRating: Int) {
        self.name = name
        self.nutritionRating = nutritionRating
    }
}
class Pizza: Food {
    override init(name: String, nutritionRating: Int) {
        super.init(name: "Pizza", nutritionRating: 3)
    }
}

class Shape {
    var sides: Int
    init(sides: Int) {
        self.sides = sides
    }
}

class Rectangle: Shape {
    var color: String
    init(color: String) {
        self.color = color
        super.init(sides: 4)
    }
}


// MARK: - How to copy classes

class User {
    var username = "Anonymous"
}

var user1 = User()
var user2 = user1
user2.username = "Taylor"
print(user1.username)
print(user2.username)

"""
This might seem like a bug, but it’s actually a feature – and a really important feature too, because it’s what allows us to share common data across all parts of our app. As you’ll see, SwiftUI relies very heavily on classes for its data, specifically because they can be shared so easily.
"""

struct UserA {
    var username = "Anonymous"
}

var user3 = UserA()
var user4 = user3
user4.username = "Taylor"
print(user3.username)
print(user4.username)


// deep copy: create a unique copy of a class instance

class UserB {
    var username = "Anonymous"
    func copy() -> UserB {
        let user = UserB()
        user.username = username
        return user
    }
}
// Now we can safely call copy() to get an object with the same starting data, but any future changes won’t impact the original.
var user5 = UserB()
var user6 = user5.copy()
user6.username = "Taylor"
print(user5.username)
print(user6.username)




class Statue {
    var sculptor = "Unknown"
}

var venusDeMilo = Statue()
venusDeMilo.sculptor = "Alexandros of Antioch"
var david = Statue()
david.sculptor = "Michaelangelo"
print(venusDeMilo.sculptor)
print(david.sculptor)


class Author {
    var name = "Anonymous"
}
var dickens = Author()
dickens.name = "Charles Dickens"
print(dickens.name)
var austen = dickens
austen.name = "Jane Austen"
print(dickens.name)
print(austen.name)


class Magazine {
    var pageCount = 32
}

var example = Magazine()
var wired = example
wired.pageCount = 164
print(wired.pageCount)
var vogue = example
vogue.pageCount = 128
print(wired.pageCount)
print(vogue.pageCount)


// MARK: - How to create a deinitializer for a class

"""

Swift’s classes can optionally be given a deinitializer, which is a bit like the opposite of an initializer in that it gets called when the object is destroyed rather than when it’s created.

This comes with a few small provisos:

1. Just like initializers, you don’t use func with deinitializers – they are special.
2. Deinitializers can never take parameters or return data, and as a result aren’t even written with parentheses.
3.Your deinitializer will automatically be called when the final copy of a class instance is destroyed. That might mean it was created inside a function that is now finishing, for example.
4. We never call deinitializers directly; they are handled automatically by the system.
5. Structs don’t have deinitializers, because you can’t copy them.

"""


class UserC {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user = UserC(id: i)
    print("User \(user.id): i'm in control!")
}

print()
// they would only be destroyed when the array is cleared
var users = [UserC]()

for i in 1...3 {
    let user = UserC(id: i)
    print("User \(user.id): i'm in control!")
    users.append(user)
}

print("Loop is finished!")
print(users)
users.removeAll()
print("Arrary is clear!")


// MARK: - How to work with variables inside classes

class UserD {
    var name = "Paul"
}

var user = UserD()
user.name = "Taylor"
print(user.name)
user = UserD()
print(user.name)


"""
1. Constant instance, constant property – a signpost that always points to the same user, who always has the same name.
2. Constant instance, variable property – a signpost that always points to the same user, but their name can change.
3. Variable instance, constant property – a signpost that can point to different users, but their names never change.
4. Variable instance, variable property – a signpost that can point to different users, and those users can also change their names.
"""

"""
One upside to all this is that classes don’t need to use the mutating keyword with methods that change their data. This keyword is really important for structs because constant structs cannot have their properties changed no matter how they were created, so when Swift sees us calling a mutating method on a constant struct instance it knows that shouldn’t be allowed.
"""

"""
要判斷class的property是否可修改的方式： 取決於class內property是否為常數,是常數就不能修改其值。
With classes, how the instance itself was created no longer matters – the only thing that determines whether a property can be modified or not is whether the property itself was created as a constant.
"""

struct Kindergarten {
    var numberOfScreamingKids = 30
    mutating func handOutIceCream() {
        numberOfScreamingKids = 0
    }
}
var kindergarten = Kindergarten()
kindergarten.handOutIceCream()


// MARK: - Checkpoint 7

"""
Your challenge is this: make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persian and Lion as subclasses of Cat.

But there’s more:

1. The Animal class should have a legs integer property that tracks how many legs the animal has.
2. The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
3. The Cat class should have a matching speak() method, again with each subclass printing something different.
4. The Cat class should have an isTame Boolean property, provided using an initializer.

"""

class Animals {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animals {
    
    func speak() {
        print("bow-wow!")
    }
    
}

class Cat: Animals {
    var isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("meow~")
    }
    
}

class Corgi: Dog {
    override func speak() {
        print("I'm a Corgi. bow-wow!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("I'm a Poodle. bow-wow!")
    }
}

class Persian: Cat {
    override func speak() {
        print("I'm a Persian. meow~")
    }
}

class Lion: Cat {
    
    override func speak() {
        print("I'm a Lion. roar~")
    }
}

let lion1 = Lion(legs: 4, isTame: true)
print(lion1.legs)
print(lion1.isTame)


print()
// 其他解法：
class Animals2 {
    var legs = 4
    init (legs: Int) {
        self.legs = max(legs, 0)
    }
}

class Dog2: Animals2 {
    var voice: String
    
    init(voice: String = "Woof~") {
        self.voice = voice
        super.init(legs: 4)
    }
    
    func speak() { print("\(voice)!") }
}

class Cat2: Animals2 {
    var voice: String
    var isTame: Bool
    
    init(voice: String = "Meow~", isTame: Bool) {
        self.voice = voice
        self.isTame = isTame
        super.init(legs: 4)
    }
    
    func speak() { print("\(voice)!") }
}

class Corgi2: Dog2 {
   init() { super.init(voice: "Ruff~") }
}

class Poodle2: Dog2 {
    init() { super.init(voice: "Yip yip~") }
}

class Persian2: Cat2 {
     init() { super.init(voice: "Yowl~", isTame: true) }
}

class Lion2: Cat2 {
    init() { super.init(voice: "Roar~", isTame: false) }
}

let animal = Animals2(legs: -1)
print(animal.legs)

let lion2 = Lion2()
print(lion2.legs)
lion2.speak()
print(lion2.isTame)

let dog2 = Poodle2()
dog2.speak()
print(dog2.legs)
