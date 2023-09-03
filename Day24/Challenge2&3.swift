//
//  Challenge2&3.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/3.
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
    @State private var questionsCount: Int = 1
    @State private var isFinalQuestion = false
    

    
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
                            // flag was tapped
                            flagTapped(number)
                        } label: {
                         // Day24 Challenge 2
                            FlagImage(text: countries[number])
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
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score) / 8")
        }
        .alert("🚩 Finish 🚩", isPresented: $isFinalQuestion) {
            Button("Restar", action: reset)
             
            } message: {
                Text("Your total score is 🎉\(score) / 8")
            }
            
        }
        

    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Question \(questionsCount)\n⭕️ Correct"
            score += 1
        } else {
            scoreTitle = "Question \(questionsCount)\n❌ Wrong \n That's the flag of \(countries[number])"
        }
        questionsCount += 1
        print(questionsCount)
        
        if questionsCount == 9 {
            isFinalQuestion = true
        }
        showingScore = true
        
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        isFinalQuestion = false
        questionsCount = 1
        score = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
