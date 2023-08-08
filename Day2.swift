//
//  Day2.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/8/8.
//

import UIKit
import Foundation

//How to store truth with Booleans

let goodDogs = true

//"!"為布林運算元，意思為“not”
var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

var gameOver = false
print(gameOver)

//toggle運用於布林的轉換,這裡等效於“！”此預算符的作用,此函式用於處理較複雜的code
gameOver.toggle()


//How to join strings togther

//"+"在String的運用
let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart

var people = "Haters"
let action =  "hate"
let lyric = people + " gonna " + action

//Swift不能一次性將所有字符不能一次性將所有字符串 連接起來，以下的實例運作方式為：先“12”->"123"->"1234"->"12345",不會一次就“12345”
let luggageCode = "1" + "2" + "3" + "4" + "5"

// "\"反斜線的運用
let name = "Taylor"
let age = 30
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

//若以“＋”連接的元素,每個元素的類型都要相同。
let number = 11
//let missionMessaage = "Apollo " + number + "landed on the moon."  number為Int其他元素為String

let missionMessaage1 = "Apollo " + String(number) + " landed on the moon."
let missionMessaage2 = "Apollo  \(number)  landed on the moon."

print("5 x 5 is \(5 * 5)")


//Checkpoint 1

//Creates a constant holding any temperature in Celsius.
//Converts it to Fahrenheit by multiplying by 9, dividing by 5, then adding 32.
//Prints the result for the user, showing both the Celsius and Fahrenheit values.

let temperatureCelsius: Double = 46.0

let temperatureFahrenheit = 9.0 / 5.0 * temperatureCelsius + 32.0

//"°" 用Option+Shift+8可打印出來
print("now temperature is \(temperatureFahrenheit)°F = \(temperatureCelsius)°C ")


func convertTemperature(c: Double) -> Double {
    
    let temperatureFahrenheit = 9.0 / 5.0 * c + 32.0

    return temperatureFahrenheit
}

let celsiusFunc = 32.0
convertTemperature(c: celsiusFunc)

print("now temperature is \(convertTemperature(c: 32.0))°F = \(celsiusFunc)°C ")

