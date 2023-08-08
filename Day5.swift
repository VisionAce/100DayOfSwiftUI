//
//  Day5.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/8/8.
//

import UIKit
import Foundation

// How to check a condition is true or false

// if statements
"""
if someCondition {
    print("Do something")
    print("Do something else")
    print("Do a thrid thing")
}
"""

// 分數大於80的狀況
let score = 85

if score > 80 {
    print("Great job!")
}

// >, <, = 的判別運用,條件處會是Boolean的結果
let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we're going we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if age >= 18 {
    print("You're eligible to vote")
}

// 字串(值)的大小比較為：首字母的字母順序,例如"Dave Lister"和"Arnold Rimmer", “Ｄ”>"A"
let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

// Make an arry of 3 numbers
var numbers = [1, 2, 3]
// Add a 4th
numbers.append(4)
// If we have over 3 items
if numbers.count > 3 {
    // Remove the oldest number
    numbers.remove(at: 0)
}
// Display the result
print(numbers)


// "=="：完全等於 , "!="：不等於 的運用
let country = "Canada"

if country == "Australia" {
    print("G'day!")
}

let name = "Taylor Swift"

if name != "Anonymous" {
    print("Welcome, \(name)")
}

// 想要確認使用者的名稱是否為空的方式：
//方式1:
// Create the username variable
var username = "taylorswift13"
// if ˋusernameˋ contains an empty string
if username == "" {
    // Maje it equal to "Anonymous"
    username = "Anonymous"
}
// Now print a welcome message
print("Welcome, \(username)!")

//為空的方式2:
"""
if username.count == 0 {
    username = "Anonymous"
}
"""//在其他程式語言count的相似用法或許很快,但在swift中不然,因為在swift中為了能支援各種複雜的字串,代價就是會逐一的檢查每個字母。

//為空的方式3:
"""
if username.isEmpty == true {
    username = "Anonymous"
}
"""

//為空的方式4:(方法3的.isEmpty 其實就是個布林值,預設為true)
"""
if username.isEmpty {
    username = "Anonymous"
}
"""

// enum比大小的運用
enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large

print(first < second)// 為何是true? 因為：在enum中Sizes為可比較的「Comparable」,又在case列舉中small較large前面,所以Sizes.small < Sizes.large


// How to check multiple conditions

let age2 = 16

if age2 >= 18 {
    print("You can vote in the next election.")
}

if age2 < 18 {
    print("Sorry, you're too young to vote.")
}

//合併以上兩種狀態,用 else
if age2 >= 18 {
    print("You can vote in the next election.")
} else {
    print("Sorry, you're too young to vote.")
}

// if ... else 使用描述
"""
if someCondition {
    print("This will run if the condition is true")
} else {
    print("This will run if the condition is false")
}
"""

// else if 的加入
let a = false
let b = true

if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}

// 「&&」的用法：等於邏輯運算的AND
let temp = 25

if temp > 20 {
    if temp < 30{
        print("It's a nice day.")
    }
}
// 合併以上的兩個條件
if temp > 20 && temp < 30 {
    print("It's a nice day.")
}

// 「||」的用法 :等於邏輯運算的OR
let userAge = 14
let hasParentalConsent = true

if userAge >= 18 || hasParentalConsent == true {
    print("You can buy the game")
}
// 可以將上面的 == true 去掉,因為hasParentalConsent已經檢查該Boolean了
if userAge >= 18 || hasParentalConsent {
    print("You can buy the game")
}

// 用 enum 合併以上的條件邏輯運算用法
enum TransportOption {
    case airplane, helicopter,  bicycle, car, scooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path...")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}


// How to use switch statements to check multiple conditions


// 以下if ... if else ... else 的code有3個問題：
"""
1. forecast會在每次檢查條件時重複寫。
2. 「.rain」的條件狀況重複兩次。
3. 「.snow」的條件狀況沒寫進去。
"""
enum weather {
    case sun, rain, wind, snow, unknown
}

let forecast = weather.sun

//if forecast == .sun {
//    print("It should be a nice day.")
//} else if forecast == .rain {
//    print("Pack an umbrella.")
//} else if forecast == .wind {
//    print("Wear something warm.")
//} else if forecast == .rain {
//    print("School is cancelled.")
//} else {
//    print("Our forecast generator is borken!")
//}


// 以 switch 改寫以上的code
switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm.")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is borken!")
}


let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:// 除了以上case以外的狀況,不能放在第一個case的位置
    print("Who are you?")
}

// fallthrough(失敗)的使用 (不常使用)
let day = 5
print("My true love gave to me...")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}



// How to use the ternary conditional operator for quick tests

let age3 = 18
let canVote = age3 >= 18 ? "Yes" : "No" // 記憶法： 「 W_hat 」?「 T_rue 」:「 F_alse 」

let hour = 23
print(hour < 12 ? "It's before nooo" : "It's after noon")//print() 括弧裡不能放if...else

"""
無法執行的code:
print(
    if hour < 12 {
        "It's before nooo"
    } else {
        "It's after noon"
    }
)
"""//要改成：
if hour < 12 {
    print("It's before nooo")
} else {
    print("It's after noon")
}



let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"


enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)
