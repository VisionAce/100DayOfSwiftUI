//
//  ContentView.swift
//  WordScramble
//
//  Created by 褚宣德 on 2023/9/9.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    @State private var isreStart = false
    
    // Day31 Challenge 3
    var score: Int {
        let sumLetters =  usedWords.reduce(0) {
            $0 + $1.count
        }
        let result = sumLetters * usedWords.count
        return result
    }
    
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(red:1.5,green:0.7, blue: 0.4),.orange]), startPoint: .leading, endPoint: .trailing)
                    .ignoresSafeArea()
                VStack {
        
                    List {
                        Section {
                            TextField("Enter your word", text: $newWord)
                                .textInputAutocapitalization(.none)
                        }
                        Section {
                            ForEach(usedWords, id: \.self) { word in
                                HStack {
                                    Image(systemName: "\(word.count).circle")
                                    Text(word)
                                }
                                // Day75
                                .accessibilityElement()
                                .accessibilityLabel(word)
                                .accessibilityHint("\(word.count) letters")
                            }
                        }
                    } // List
                    .navigationTitle(rootWord)
                    .onSubmit(addNewWord)
                    .onAppear(perform: startGsme)
                    .alert(errorTitle, isPresented: $showingError) {
                        Button("OK", role: .cancel) { }
                    } message: {
                        Text(errorMessage)
                    }
                    // Day31 Challenge 2
                    .toolbar {
                        Button {
                            isreStart = true
                        } label: {
                            Image(systemName: "gear")
                            Text("restart")
                        }
                    }
                    
                    // Day31 Challenge 3
                    Text("Scoring Method:\nThe quantity of spelled-out English words multiplied by the total number of letters in all English words.")
                        .foregroundStyle(.primary)
                        .font(.subheadline)
                        .padding()
                    Text("Score: \(score)")
                        .font(.largeTitle)
                        .foregroundStyle(.blue)
                    
                    
                } // VStack
            
            }
            // Day31 Challenge 2
            .alert("確定要重置？", isPresented: $isreStart) {
                Button("確定") {
                    restart()
                }
                Button("取消", role: .cancel) { }
            }
                   
        } // NavigationView
        
    }
    func addNewWord() {
        // lowercase and trim the word, to make sure we don't add duplicate words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        // exit if the remaining string is empty
        guard answer.count > 0 else { return }
        
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you Know!")
            return
        }
        
        // Day31 Challenge 1
        guard notStartWord(word: answer) else {
            wordError(title: "Word is start word", message: "You can't use start word!")
            return
        }
        // Day31 Challenge 1
        guard notShorter(word: answer) else {
            wordError(title: "Word too short", message: "Please spell a word with more than two letters")
            return
        }
        
        withAnimation {
            // 用insert而不是append的原因：if we had used append(answer) the new words would have appeared at the end of the list where they would probably be off screen, but by inserting words at the start of the array they automatically appear at the top of the list – much better.
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    func startGsme() {
        // 1. Find the URL for start.txt in our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. Load start.txt into a string
            if let starWords = try? String(contentsOf: startWordsURL) {
                // 3. Split the string up into an array of strings, splitting on line breaks
                let allWords = starWords.components(separatedBy: "\n")
                // 4. Pick one random word, or use "silkworm" as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"
                // If we are here everything has worked, so we can exit
                return
            }
        }
        // If were are *here* then there was a problem – trigger a crash and report the error
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspellRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspellRange.location == NSNotFound
    }
    
    // Day31 Challenge 1
    func notStartWord(word: String) -> Bool {
        return word != rootWord
    }
    
    // Day31 Challenge 1
    func notShorter(word: String) -> Bool {
        return word.count > 2
    }
    
    func wordError(title: String, message: String) {
        errorMessage = title
        errorMessage = message
        showingError = true
    }
    
    // Day31 Challenge 2
    func restart() {
        startGsme()
        newWord = ""
        usedWords.removeAll()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
