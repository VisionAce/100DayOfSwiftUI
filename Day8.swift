//
//  Day8.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/8/11.
//

import UIKit
import Foundation

// How to provide default values for parameters

func printTimesTables(for number: Int, end: Int){
    for i in 1...end {
        print("\(i) x \(number) = \(i * number)")
    }
}

printTimesTables(for: 3, end: 5)

print()
// 給定預設值
func printTimesTables2(for number: Int, end: Int = 12){
    for i in 1...end {
        print("\(i) x \(number) = \(i * number)")
    }
}

printTimesTables2(for: 5)
print()
printTimesTables2(for: 2, end: 4)

print()
// 預設參數使我們在函數中保持靈活性,例如：removeAll(keepingCapacity: ) 預設值為false,有需要用到的時候再設定為true
var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true) // keepingCapacity作用為保存removeAll之前Array所存元素的記憶體容量,預設值為false
print(characters.count)



// How to handle errors in functions

"""
Swift makes us handle errors – or at least acknowledge when they might happen.

This takes three steps:

1. Telling Swift about the possible errors that can happen.            1. 告訴Swift有哪些可能產生的錯誤
2. Writing a function that can flag up errors if they happen.          2. 標示出錯誤
3. Calling that function, and handling any errors that might happen.   3. 處理錯誤
"""

// Let’s work through a complete example: if the user asks us to check how strong their password is, we’ll flag up a serious error if the password is too short or is obvious.

enum PasswordError: Error {
    case short, obvious
}


// we’re going to write a function that checks the strength of a password: if it’s really bad – fewer than 5 characters or is extremely well known – then we’ll throw an error immediately, but for all other strings we’ll return either “OK”, “Good”, or “Excellent” ratings.
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

"""
The final step is to run the function and handle any errors that might happen. Swift Playgrounds are pretty lax about error handling because they are mostly meant for learning, but when it comes to working with real Swift projects you’ll find there are three steps:

1. Starting a block of work that might throw errors, using  do .
2. Calling one or more throwing functions, using  try .
3. Handling any thrown errors using  catch .

// 處理錯誤
do {
    try someRiskyWork()
} catch {
    print("Handle errors here")
}

"""
print()

// 處理錯誤
let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch {
    print("There was an error.")
}

// 進一步地處理 catch 的錯誤訊息
do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error: \(error.localizedDescription)") // error.localizedDescription 頻果系統給出的有意義之錯誤訊息
}

print()
// Checkpoint 4
"""

The challenge is this: write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:

1. You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
2. If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
3. You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
4. If you can’t find the square root, throw a “no root” error.

"""
enum ErrorNumber: Error {
    case outOfBounds, noRoot
}

func root (of number: Int) throws -> Int {
    // out of bounds
    if number < 1 || number > 10_000 {
        throw ErrorNumber.outOfBounds
    }
    // Perfect Square
    for i in 1...100 {
        if number == i * i {
            return i
        }
    }
    // no root
    throw ErrorNumber.noRoot
}

do{
    let result = try root(of: 256)
    print("The root is \(result)")
} catch ErrorNumber.outOfBounds {
    print("out of bounds")
} catch ErrorNumber.noRoot {
    print("no root")
}

print()
// 參考網路大神的解法，來源：https://www.hackingwithswift.com/forums/100-days-of-swiftui/checkpoint-4-good-solution/10651
func root2 (of number: Int) throws -> String {
    guard number > 1 && number < 10_000 else {
        throw ErrorNumber.outOfBounds
    }
    for i in 1...100 {
        if number == i * i {
            return "\(i)"
        }
    }
    throw ErrorNumber.noRoot
}

do{
    let result = try root2(of: 1000_000_000)
    print("The root is \(result)")
} catch ErrorNumber.outOfBounds {
    print("out of bounds")
} catch ErrorNumber.noRoot {
    print("no root")
}

