//
//  Day7.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/8/9.
//

import UIKit
import Foundation

// How to reuse code with functions

print("Welcome to my app!")
print("By default This prints out a conversion")
print("chart from centimeters to inches, but you")
print("can also set a custom range if you want.")
print()

func showWelcom() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

showWelcom()


// isMultiple(of:) is a function that belongs to integers.
let number = 139

if number.isMultiple(of: 2) {
    print("\(number) is Even")
} else {
    print("\(number) is Odd")
}


// random() is a function
let roll = Int.random(in: 1...20)
print(roll)

// TimesTables
// we have both parameters and arguments
// 引數的順序不可以顛倒,例如：「 printTimesTables(end: 20, number: 5) 」(與以下的code比較)
func printTimesTables (number: Int, end: Int) {
    for i in 1...end {
        print("\(i) * \(number) = \(i * number)")
    }
}

printTimesTables(number: 3, end: 6)

"""
 Parameter vs Argument:
 Parameter/Placeholder, Argument/Actual Value

ps:有人會把兩者視為同一個詞，Paul習慣用Parameter
"""

// How to return values from functions

let root = sqrt(169)
print(root)


// the dice roll to use a 6-sided dice

func rollDice () -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

// do two strings contain the same letters, regardless of their order? This function should accept two string parameters, and return true if their letters are the same.
func areLettersIdentical (str1: String, str2: String) -> Bool {
    let first = str1.sorted()
    let second = str2.sorted()
    return  first == second
}
let resultLetter = areLettersIdentical(str1: "absc", str2: "scab")
print(resultLetter)

// 勾股定理: a^2 + b^2 = c^2
func pythagoras (a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}
let c = pythagoras(a: 6, b: 8)
print(c)

// pythagoras 可改成：
func pythagoras2 (a: Double, b: Double) -> Double {
   sqrt(a * a + b * b)
}
print(pythagoras2(a: 3, b: 4))


// 如果你的function不返回任何值,仍可以使用單獨的return來強制結束function。例如：需要檢查輸入是否符合預期的條件,如果不符合,你希望再繼續之前立即退出function。
func sayHello() {
    return
}


// How to return multiple values from functions

func isUppercase(string: String) -> Bool {
    string == string.uppercased() // 此為1行code,且運算結果為Bool(true or false)所以可以省略return
}

// If you want to return two or more values from a function, you could use an array.
func getUser() -> [String] {
    ["Taylor", "Swift"]
}

let user = getUser()
print("Name: \(user[0]) \(user[1])") // user[0] 這樣的寫法為造成不易閱讀(理解)的code,而且或許user[0]、user[1]根本不存在

// getUser() 可以用tuple 來改善上述的問題
func getUser2() ->(firstName: String, lastName: String) {
    (firstName: "Taylor",lastName: "Swift") // ("Taylor", "Swift") 此寫法與左邊相同
}
let user2 = getUser2()
print("Name: \(user2.firstName) \(user2.lastName)")


// sometimes you’ll find you’re given tuples where the elements don’t have names. When this happens you can access the tuple’s elements using numerical indices starting from 0, like this:
func getUser3() -> (String, String) {
    ("Taylor", "Swift")
}
let user3 = getUser3()
print("Name: \(user3.0) \(user3.1)")


// if a function returns a tuple you can actually pull the tuple apart into individual values if you want to.
func getUser4() ->(firstName: String, lastName: String) {
    (firstName: "Taylor",lastName: "Swift")
}
let user4 = getUser4()
let firstName = user4.firstName
let lastName = user4.lastName
print("Name: \(firstName) \(lastName)")

// 改寫以上的tuple裡各值的呈現方式
func getUser5() ->(firstName: String, lastName: String) {
    (firstName: "Taylor",lastName: "Swift")
}
let (firstName2, lastName2) = getUser5()
print("Name: \(firstName2) \(lastName2)")

// 如果我們只要tuple中的其中一元素
func getUser6() ->(firstName: String, lastName: String) {
    (firstName: "Taylor",lastName: "Swift")
}
let (firstName3, _) = getUser5() // 只要 firstName
print("firstName: \(firstName3)")

let (_, lastName3) = getUser5() // 只要 lastName
print("lastName: \(lastName3)")


// How to customize parameter labels

func rollDice(sides: Int, count: Int) -> [Int] {
    // Star with an empty array
    var rolls = [Int]()
    
    // Roll as many dice as needed
    for _ in 1...count {
        // Add each result to our array
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }
    
    // Send back all the rolls
    return rolls
}

let rolls = rollDice(sides: 12, count: 10)

// This method of naming parameters for external use is so important to Swift that it actually uses the names when it comes to figuring out which method to call. This is quite unlike many other languages, but this is perfect valid in Swift:
func hireEmployee(name: String) { }
func hireEmployee(title: String) { }
func hireEmployee(location: String) { }

// 省略parameters(參數)的 function
let lyric = "I see ared door and I want it paint black."
print(lyric.hasPrefix("I see")) // func hasPrefix(_ prefix: String) -> Bool 用「 _ 」底線來省略實例中的參數。

// 用以上的方式,來套用到我們自己寫的function,例如：
func isUppercase2(string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let string2 = "hELLO, WORLd"
let result2 = isUppercase2(string: string)

func isUppercase2(_ string: String) -> Bool {
    string == string.uppercased()
}
let result3 = isUppercase2(string2)

// 有些function不適合用「 _ 」來省略參數,可以用for來代替使用,例如：
func printTimesTables2(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) = \(i * number)")
    }
}
printTimesTables2(number: 5)

print()
//嘗試用for來取代參數,但以下code會有問題

//func printTimesTables2(for: Int) {
//    for i in 1...12 {
//        print("\(i) x \(for) = \(i * for)")
//    }
//}
//printTimesTables2(number: 5)

// 修正以上的code
func printTimesTables3(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) = \(i * number)")
    }
}
printTimesTables3(for: 4)

"""
Tip: Earlier I mentioned that technically values you pass in to a function are called “arguments”, and values you receive inside the function are called parameters. This is where things get a bit muddled, because now we have argument labels and parameter names side by side, both in the function definition. Like I said, I’ll be using the term “parameter” for both, and when the distinction matters you’ll see I distinguish between them using “external parameter name” and “internal parameter name”.
"""
