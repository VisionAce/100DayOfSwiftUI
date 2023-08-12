//
//  Day9.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/8/13.
//

import UIKit
import Foundation

// How to create and use closures

func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser
greetCopy()

// assign the functionality directly to a constant
let sayHello = {
    print("Hi there!")
}
sayHello()

let sayHello2 = {(name: String) -> String in
    "Hi \(name)"
}


var greetCopy2: () -> Void = greetUser //  () -> () 盡量避免這樣寫，因為箭頭後可能被誤認為是empty parameter list


func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)  // 複製getUserData()這function的型別,但不包含外部參數的名稱,所以不是 data(for:1989)
print(user)

sayHello2("Taylor")



let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

// 想自訂排序:隊長永遠排在第一，剩下的則照字母順序排列
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
}

// 傳遞function
let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

// 傳遞closure
let captainFirstTeam2 = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
})


// How to use trailing closures and shorthand syntax

let captainFirstTeam3 = team.sorted  { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
}

// shorthand syntax

let captainFirstTeam4 = team.sorted  {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    return $0 < $1
}

// 反向排序
let reverseTeam = team.sorted {
    return $0 > $1
}

// shorthand syntax
let reverseTeam2 = team.sorted { $0 > $1 }

"""
以下的狀況不適合用shorthand syntax：
1. The closure’s code is long.
2. $0 and friends are used more than once each.
3. You get three or more parameters (e.g. $2, $3, etc).

"""

// filter()
let tOnly = team.filter {$0.hasPrefix("T") }
print(tOnly)

// map()
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)


// How to accept functions as parameters


func makeArray(size: Int, using generator: ()-> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    return numbers
}

let roll = makeArray(size: 50) {
    Int.random(in: 1...20)
}
print(roll)



func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 20, using: generateNumber)
print(newRolls)


// 一個function以3個不同的function作為參數

func doImportantWork (first: () -> Void, second: () ->Void, thrid: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start thrid work")
    thrid()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} thrid: {
    print("This is the thrid work")
}


// Checkpoint 5
"""
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

Your job is to:

1. Filter out any numbers that are even
2. Sort the array in ascending order
3. Map them to strings in the format “7 is a lucky number”
4. Print the resulting array, one item per line

"""

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

var removeEven = [Int]()

// Filter out any numbers that are even
let evenNumber =  luckyNumbers.filter { $0.isMultiple(of: 2) }
print(evenNumber)

for i in 0...9 {
    
    if luckyNumbers[i] == evenNumber[0] {
        
    } else if luckyNumbers[i] == evenNumber[1] {
        
    } else if luckyNumbers[i] == evenNumber[2] {
        
    } else if luckyNumbers[i] == evenNumber[3] {
        
    } else {
        removeEven.append(luckyNumbers[i])
    }
}
print(removeEven)

// Sort the array in ascending order
let ascendingNumber = removeEven.sorted()
print(ascendingNumber)

// Map them to strings in the format “7 is a lucky number”
let formatNumber = ascendingNumber.map { "\($0) is a lucky number" }

// Print the resulting array, one item per line
for i in 0...5 {
    print(formatNumber[i])
}

print()




// 大神解法：

let checkPoint5 = { (luckyNumber: [Int]) in
        luckyNumber.filter {!($0.isMultiple(of: 2))}
        .sorted()
        .map { print("\($0) is a lucky number") }
}

checkPoint5(luckyNumbers)
