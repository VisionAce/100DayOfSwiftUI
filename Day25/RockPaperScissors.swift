//
//  RockPaperScissors.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/4.
//
// Day25 Challenge
//

import SwiftUI

struct ObviousBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(.vertical, 100)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct Rainbow: View {
    var body: some View {
            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .purple, .indigo, .red]), center: .center)
                .ignoresSafeArea()
    }
}

extension View {
    func obviousBackgroundModifier() -> some View {
        modifier(ObviousBackground())
    }
}


struct ContentView: View {
    
    @State private var systemMora:Int = Int.random(in: 0...2)
    @State private var score:Int = 0
    @State private var gameTurn = 1
    @State private var showResult = false
    @State private var result = ""
    @State private var alertTitle = ""
    @State private var alertButton = ""
    @State private var ScoreType = ""
    
    
    let mora = ["✊", "🖐️", "✌️"]
    let results = ["Win", "Lose", "Tie"]
    let ScoreTypes = ["+ 1", "- 1", "+ 0"]
    let endGame = 10
    
    var body: some View {
        ZStack {
            Rainbow()
            VStack {
                Spacer()
                Text("猜拳遊戲")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                VStack(spacing: 20) {
                    Text("請出拳")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    
                    
                    HStack {
                        ForEach(0..<3) { number in
                            Button {
                                gameFight(for: number)
                                
                            } label: {
                                Text(mora[number])
                                    .font(.system(size: 60))
                                    .padding()
                                    .background(.indigo)
                                    .clipShape(Capsule())
                            }
                            
                        }
                        
                    }
                    
                    
                }// VStack
                .obviousBackgroundModifier()
                .alert(alertTitle, isPresented: $showResult) {
                    Button(alertButton, action: askQuestion)
                } message: {
                    Text("～機器出拳～\(mora[systemMora])\n Score: \(ScoreType)")
                }
                Spacer()
                Spacer()
                
                Text("Total Score: \(score)")
                    .font(.largeTitle)
                    .foregroundStyle(.primary)
                Spacer()
            }// VStack
        } // ZStack
    }
    
    
    func gameFight(for number: Int) {
        if number == systemMora {
            print("Tie")
            result = results[2]
            ScoreType = ScoreTypes[2]
        } else if (number == 0 && systemMora == 1) || (number == 1 && systemMora == 2) || (number == 2 && systemMora == 0)  {
            print("Lose")
            result = results[1]
            ScoreType = ScoreTypes[1]
            score -= 1
            
        } else if (number == 0 && systemMora == 2) || (number == 1 && systemMora == 0) || (number == 2 && systemMora == 1) {
            print("Win")
            result = results[0]
            ScoreType = ScoreTypes[0]
            score += 1
        }
        
        alertButton = gameTurn == endGame ? "Restart" : "Continue"
        alertTitle = gameTurn == endGame ? "Game Over\n Round\(gameTurn)\n \(result)" : "Round \(gameTurn)\n \(result)"
        showResult = true
    }
    
    
    func askQuestion() {
        systemMora = Int.random(in: 0...2)
        
        gameTurn = gameTurn < endGame ? gameTurn + 1 : 1
        print(gameTurn)
        if gameTurn == 1 {
            score = 0
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
