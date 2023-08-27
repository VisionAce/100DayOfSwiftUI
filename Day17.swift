//
//  Day17.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/8/27.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        // 因為Picker裡面ForEach(2..<100)的關係 所以實際存取人數會是(numberOfPeople + 2)
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format:
                            .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                        
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD" ))
                }
                
            }
            // 因為navigation view可顯示多個view,所以其修改器要加在NavigationView裡面 ˋ Form { }. ˋ ,而不是ˋNavigationView { }.ˋ
            .navigationTitle("WeSplit")
            // 透過amountIsFocused布林值的變化,控制keyboard的使用(顯示/隱藏)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()// 讓Button("Done")可排在鍵盤的右邊
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
