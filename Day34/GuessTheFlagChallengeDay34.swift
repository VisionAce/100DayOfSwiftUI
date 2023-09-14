//
//  GuessTheFlagChallengeDay34.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/15.
//

import SwiftUI

// Day24 Challenge 2
struct FlagImage: View {
    var text: String
    var body: some View {
        Image(text)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
        
    }
}

// Day24 Challenge 3
struct ProminentTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.weight(.semibold))
            .foregroundStyle(.blue)
    }
}
// Day24 Challenge 3
extension View {
    func largeTitle() -> some View {
        modifier(ProminentTitle())
    }
}


struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score: Int = 0
    @State private var questionsCount = 1
    @State private var alertTitle = ""
    @State private var scoreType = ""
    
    // Day34 Challenge 3
    @State private var animationAmount = 1.0
    @State private var pickFlagNumber = 0
    @State private var isCorrect = false
    @State private var isFadeOutAndScale = false
    @State private var isWrong = false
    
    private let endGame = 8
 
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                        // Day24 Challenge 3
                            .largeTitle()
                        
                    }// VStack
                    
                    ForEach(0..<3) { number in
                        Button {
                            // Day34 Challenge
                            withAnimation {
                                // flag was tapped
                                flagTapped(number)
                            }
                        } label: {
                            // Day24 Challenge 2
                            FlagImage(text: countries[number])
                            // Day34 Challenge 1
                                .rotation3DEffect(.degrees(isCorrect && pickFlagNumber == number ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                            // Day34 Challenge 2
                                .opacity(isFadeOutAndScale && pickFlagNumber != number ? 0.25 : 1)
                            // Day34 Challenge 3
                                .scaleEffect(isFadeOutAndScale && pickFlagNumber != number ? animationAmount : 1)
                                .wiggling(isWiggling: $isWrong, rotationAmount: isWrong && pickFlagNumber == number ? 6 : 0, bounceAmount: isWrong && pickFlagNumber == number ? 3 : 0)
                                
                        
                        }
                        
                    }
                    
                }// VStack
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score) / 8")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
                
            }// VStack
            .padding()
        }// ZStack
        .alert(scoreTitle + alertTitle, isPresented: $showingScore) {
            Button(questionsCount == endGame ? "Restart" : "Continue", action: questionsCount == endGame ? reset : askQuestion)
        } message: {
            Text("Your \(scoreType) score is 🎉\(score) / 8")
        }
        
        
    }
    
    
    
    func flagTapped(_ number: Int) {
        pickFlagNumber = number
        if number == correctAnswer {
            scoreTitle = "Question \(questionsCount)\n⭕️ Correct"
            score += 1
            isCorrect = true
            isFadeOutAndScale = true
            animationAmount -= 0.3
            
        } else {
            scoreTitle = "Question \(questionsCount)\n❌ Wrong \n That's the flag of \(countries[number])"
            isFadeOutAndScale = true
            isWrong = true
            animationAmount -= 0.3
        }
        
        alertTitle = questionsCount == endGame ? "\n\n🚩 Finish 🚩" : ""
        scoreType = questionsCount == endGame ? "Final" : ""
        
        // Day34 Challenge
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            showingScore = true
        }
       
        
    }
    
    func askQuestion() {
        questionsCount = questionsCount < endGame ? questionsCount + 1 : questionsCount
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        isCorrect = false
        isFadeOutAndScale = false
        isWrong = false
        animationAmount = 1.0
    }
    
    func reset() {
        questionsCount = 1
        score = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        isCorrect = false
        isFadeOutAndScale = false
        isWrong = false
        animationAmount = 1.0
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
