//
//  Day6.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/8/8.
//
import UIKit
import Foundation

// How to use a for loop to repeat work

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}
// os為loop的變數,可以替換成任意的代稱,例如：
for name in platforms {
    print("Swift works great on \(name).")
}

for i in 1...12 {
    print("5 x \(i) = \(5 * i)")
    
}

// nested loops
for i in 1...12 {
    print("The \(i) times table")
    
    for j in 1...12 {
        print("\(i) * \(j) = \(i * j)")
    }
    print()
}

// 執行範圍
for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

for i in 1 ..< 5 {
    print("Counting  1 up to 5: \(i)")
}

// 不想要loop變數
var lyric = "Haters gonna"

for _ in 1 ... 5 {
    lyric += " hate"
}
print(lyric)


// How to use a while loop to repeat work
var countdown = 10
while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}
print("Blast off!")

// 用於未知的執行次數,例如： random(in:)
// Int
let id = Int.random(in: 1...1000)
// Double
let amount = Double.random(in: 0...1)


// create an integer to store our roll
var roll = 0
var rollcount = 0
// carry on looping until we reach 20
while roll != 20 {
    // roll a new dice and print what it was
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
    rollcount += 1
}
// if we're here it means the loop ended – we got a 20!
print("Critical hit!")
print("Total： \(rollcount) times")



// How to skip loop items with break and continue

// continue
let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]
for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    print("Found picture: \(filename)")
}

// break
let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
}
print(multiples)

// 運用break的時機,以下的code可因為break的使用,讓loop少跑兩次。
let scores = [1, 8, 4, 3, 0, 5, 2]
var count = 0

for score in scores {
    if score == 0 {
        break
    }

    count += 1
}

print("You had \(count) scores before you got 0.")



// Why does Swift have labeled statements?
let options = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]

outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}

print()

// Checkpoint 3
"""
The problem is called fizz buzz, and has been used in job interviews, university entrance tests, and more for as long as I can remember. Your goal is to loop from 1 through 100, and for each number:

If it’s a multiple of 3, print “Fizz”
If it’s a multiple of 5, print “Buzz”
If it’s a multiple of 3 and 5, print “FizzBuzz”
Otherwise, just print the number.
"""


for i in 1...100 {
    
    if i.isMultiple(of: 15) {
        print("FizzBuzz")
    }
    
    else if i.isMultiple(of: 3)  {
        if i.isMultiple(of: 15) {
            continue
        }
        print("Fizz")
    }
    
    else if i.isMultiple(of: 5) {
        if i.isMultiple(of: 15) {
            continue
        }
        print("Buzz")
    } else {
        print("\(i)")
    }
    
}

