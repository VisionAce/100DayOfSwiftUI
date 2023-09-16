//
//  MultiplictionTablesGame.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/16.
//

import SwiftUI

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding(8)
            .background(.black)
            .cornerRadius(12)
    }
}

extension View {
    func buttonStyleModifier() -> some View {
        modifier(ButtonStyle())
    }
}

struct GameView: View {
//    let turn:Int
    var questionNumbers1 = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].shuffled()
    var questionNumbers2 = [1, 2, 3, 4, 5, 6, 7, 8, 9].shuffled()
    @State private var answerCount:[Int] = [0, 0, 0, 0, 0]
    @State private var isDone = false
    
    var body: some View {
            VStack {
                ForEach(0..<answerCount.count, id: \.self) {
                    Text("Question \($0 + 1)\n \(questionNumbers1[$0]) X \(questionNumbers2[$0]) = ?")
                    if isDone {
                        Text("Ans.  \(questionNumbers1[$0] * questionNumbers2[$0])")
                    }
                    TextField("答案", value: $answerCount[$0] , format: .number)
                    
                }
                Button("完成") {
                    isDone = true
                }
               
            }// VStack
    }
}

struct ContentView: View {
    @State private var number = 2
    @State private var questionCount = 10
    @State private var gameStar = false
    @State private var answer = 0
    @State private var turn = 1
    @State private var gameTurn = 0
    
    let questionCounts = [5, 10, 20]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    if gameStar == false {
                        Stepper(value: $number,
                                in: 2...12,
                                step: 1) {
                            Text("乘法表參考:   \(number) 的乘法表")
                        }
                    }
                } // Section: 調整乘法表的數字
                
                if gameStar == false {
                    Section("想要挑戰幾關呢？") {
                        HStack {
                            Picker("想要挑戰幾關呢？", selection: $questionCount) {
                                ForEach(questionCounts, id: \.self) {
                                    Text("\($0) 關")
                                    
                                }
                            }
                            .pickerStyle(.segmented)
                            Button {
                                gameStar = true
                            } label: {
                                Text("開始遊戲")
                                    .buttonStyleModifier()
                            }
                        } // HStack
                        
                    } // Section: 關卡數
                }
                Section {
                    if gameStar == false {
                        Text("乘法表:")
                        ForEach(1..<10) {
                            Text("\(number) X \($0) = \(number * $0)")
                        }
                    } else {
                        GameView()
                    }
            
                } // Section: 乘法表
            } // Form
        } // NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
