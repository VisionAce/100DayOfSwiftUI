//
//  ContentView.swift
//  RollDice
//
//  Created by 褚宣德 on 2023/12/16.
//

import SwiftUI

// MARK: - TO DO LIST
/// 1.  Store the results using JSON or Core Data – anywhere they are persistent.
/// 2. Add haptic feedback when dice are rolled.
/// 3. Make the value rolled by the dice flick through various possible values before settling on the final figure.

struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var sides = 4
    @State private var times = 1
    @State private var results = [[Int]]()
    @State private var isShowingResult = false
    @Environment(\.dismiss) var dismiss
    @State private var rollCount = 0
    @State private var finalTotalPoints = [Int]()
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("sides of dice")
                    TextField("side", value: $sides, format: .number)
                }
                Section {
                    Text("Times of Roll")
                    TextField("Times", value: $times, format: .number)
                }
                
                Button("Roll") {
                    numbers = roll(diceSided: sides, rollTimes: times)
                    results.append(numbers)
                    rollCount += times
                    finalTotalPoints.append(numbers.reduce(0){$0 + $1})
                }
                Text("Result:")
                ForEach(0..<numbers.count, id: \.self) { index in
                    Text("Roll\(index + 1): \(numbers[index])")
                }
                
                Text("Total Point: \(numbers.reduce(0){$0 + $1})")
            }
            .navigationTitle("Rolling")
            .toolbar {
                ToolbarItem {
                    Button {
                        isShowingResult = true
                    } label: {
                        Image(systemName: "list.bullet.clipboard.fill")
                    }
                }
            }
            .sheet(isPresented: $isShowingResult) {
                
                NavigationStack {
                    List {
                        Text("Roll Count: \(rollCount)")
                        Text("TotalPoint: \(finalTotalPoints.reduce(0){$0 + $1})")
                        ForEach (results, id: \.self) { items in
                            ForEach(0..<items.count, id: \.self) { i in
                                Text("Roll\(i + 1): \(items[i])")
                            }
                           
                        }
                        
                    }
                    .toolbar {
                            Button("Done", action: done)
                    }
                }
                
            }
            
        }
    }
    
    func roll(diceSided: Int = 4, rollTimes: Int) -> [Int] {
        let rangSided = 1...diceSided
        let rangRollTimes = 0..<rollTimes
        
        var resultArray = [Int]()
        for _ in rangRollTimes {
            let number = Int.random(in: rangSided)
            resultArray.append(number)
        }
        
        return resultArray
    }
    
    func done() {
        dismiss()
    }
    
}







#Preview {
    ContentView()
}
