//
//  Day3.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/8/8.
//

import UIKit
import Foundation

//How to store ordered data in arrays

var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

print(beatles[0])
print(numbers[1])
print(temperatures[2])

//append()
beatles.append("Adrian")
beatles.append("Allen")
beatles.append("Novall")
beatles.append("Vivian")

//型別不符
//temperatures.append("Chris")
temperatures.append(36.7)

let firstBeatle = beatles[0]
let firstNumber = numbers[0]
//兩類型不同，不能作“＋”運算 ->Swift的type safty特性
//let notAllowed = firstBeatle + firstNumber

var scores = Array<Int>() //等效於 var scores = [Int]()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

var albums = [String]()
albums.append("Folkore")
albums.append("Fearless")
albums.append("Red")
print(albums.count)

//remove(at:) & removeAll()
var characters = ["Lana", "Pam" , "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2)
print(characters.count)

characters.removeAll()
print(characters.count)

//contains()
let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))//bondMovies的元素中不含有Frozen這部電影，所以為false

//sorted()
let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())//按照元素大小存取，由小到大(預設)
print(cities.sorted(by: >))//由大到小

//reversed()
let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)//提示：Swift 在反轉數組時非常聰明 - 它實際上並不執行對所有項目重新排序的工作，而是它自己記住您想要反轉這些項目。 因此，當您打印出reversePresidents 時，請不要驚訝地發現它不再只是一個數組！
print(reversedPresidents.first!)
print(reversedPresidents.contains("Trump"))


//How to  store and find data in dictionaries

var employee = ["Taylor Swift", "singer", "Nashville"]
print("Name: \(employee[0])")
print("Job title: \(employee[1])")
print("Location: \(employee[2])")
//當移除employee的其中一元素,相對的值就會有所改變,以下註解的code就會有問題
//print("Name: \(employee[0])")
//   employee.remove(at: 1)
//print("Job title: \(employee[1])")
//print("Location: \(employee[2])")

let employee2 = [
    "name": "Taylor Swift",
    "job": "singer",
    "location": "Nashville"
]

//print(employee2["name"])//Optional("Taylor Swift")
//print(employee2["job"])//Optional("singer")
//print(employee2["location"])//Optional("Nashville")
//print(employee2["password"])//nil

//provide a default value to use if the key doesn't exist.
print(employee2["name", default: "Unkown"])//Taylor Swift
print(employee2["job", default: "Unkown"])//singer
print(employee2["location", default: "Unkown"])//Nashville


let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false
]
print(hasGraduated["Eric"]!)


let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]
print(olympics[2012, default: "Unkown"])


var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206


var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
print(archEnemies["Batman", default: "Unkown"])
print(archEnemies.values)

archEnemies["Batman"] = "Penguin"
print(archEnemies["Batman", default: "Unkown"])
print(archEnemies.values)

print(archEnemies.count)
archEnemies.removeAll()
print(archEnemies.count)


//How to use sets for fast data lookup
let people = Set(["Denzel Washington", "Tom Cruise" ,"Nicolas Cage", "Samuel L Jackson"])
print(people)//Set 每次執行後印出元素的順序都有可能不同

//insert(),在Set新增資料不同於Array用的append(),是因為Set不在乎元素間順序的問題。
var people2 = Set<String>()
people2.insert("Denzel Washington")
people2.insert("Tom Cruise")
people2.insert("Nicolas Cage")
people2.insert("Samuel L Jackson")


//How to create and use enums
var selected = "Monday"//星期
selected = "Tuesday"//星期
selected = "January"//月份

enum weeked {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = weeked.monday
day = weeked.tuesday
day = weeked.friday


enum weeked2 {
    case monday, tuesday, wednesday, thursday, friday
}

var day2 = weeked2.friday
day2 = .tuesday
day2 = .monday

