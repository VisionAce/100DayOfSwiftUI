//
//  Day4.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/8/8.
//

import UIKit
import Foundation


//How to use type annotations

let surname: String = "Lasso"

//有標註資料的型別後,我們能準確的控制“0”是Int還是Double,來方便操作我們需要的資料
var score: Int = 0
var score2: Double = 0

let playerName: String = "Roy"
var luckyNumber: Int = 13
let pi: Double = 3.141
var isAuthenticated: Bool = true
//Array
var albums:[String] = ["Red", "Fearless"]
//Dictionary
var user: [String: String] = ["id": "@twostraws"]
//Set
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])

//當要建立空的資料類型,如以下的team那麼type annotation就很重要
var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]//var soda = ["Coke", "Pepsi", "Irn-Bru"] 不需要特別寫String,Xcode這裡也知道資料型別,因為我們後面有實際給出資訊。
var teams: [String] = [String]()

//有些人建立空的array會這樣
var cities: [String] = []
//Paul比較建議用type inference
var clues = [String]()

//enum
enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light
style = .dark

//Swift是個 type-safe 的語言,所以不論是變數或常數資料都要清楚其類型的定義和架構,以下例子：當省略「userName = "@twostraws"」這行時,會無法print(userName),因為縱使有資料類型的定義「let userName: String」,但沒有初始化,就不知道userName裡面包含著什麼。
let userName: String
// lots of complex logic
userName = "@twostraws"
// lots of more complex logic
print(userName)

//雖然type annotation可以小我們一定程度得覆蓋type inference,但前提還是要發生在該code是可以運行的狀態下,例如：(以下註解掉的例子,是不被允許的,因為我們前面定義score為Int後面給的內容卻是String)
//let score: Int = "Zero"



// Checkpoint 2

//Create an array of strings, then write some code that prints the number of items in the array and also the number of unique items in the array.

let colors: [String] = ["red", "orange", "yellow", "green", "blue", "indigo", "violet"]

print(colors[0])
print(colors.count)

for color in colors {
    print("My favorite color is \(color)")
}
