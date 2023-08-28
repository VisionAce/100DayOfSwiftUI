//
//  Day18.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/8/28.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 0.0
    @State private var amountOfPeople = 2
    @State private var tipRate = 10.0
    @State private var isEditingTipRate = false
    @FocusState private var holdView: Bool
    
    var amountPerPerson: Double {
        let people = Double(amountOfPeople + 2)
        let totalAmount = amount * (1 + tipRate / 100)
        let perPersonCost = totalAmount / people
        
        return perPersonCost
    }
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section("花費金額") {
                        TextField("Amount", value: $amount, format:
                                .currency(code: Locale.current.currency?.identifier ?? "USD" ))
                                .focused($holdView)
                        
                    }// amount
                    
                    Section {
                        Picker("人數", selection: $amountOfPeople) {
                            ForEach (2..<100) {
                                Text("\($0) 人" )
                            }
                        }
                        .pickerStyle(.navigationLink)
                        
                        // tipRate
                        HStack {
                            Slider(
                                value: $tipRate,
                                in: 0...100,
                                step: 10
                            ) {
                                Text("tipRate")
                            } minimumValueLabel: {
                                Text("0")
                            } maximumValueLabel: {
                                Text("100")
                            } onEditingChanged: { editing in
                                isEditingTipRate = editing
                            }
                            Text("小費 \(tipRate, specifier: "%.f")％")
                                .foregroundColor(isEditingTipRate ? .red : .blue)
                        } // HStack
                    }//amountOfPeople + tipRate
                    
                    Section("總金額") {
//                        Text("\(amount * (1 + tipRate / 100), specifier: "%.2f")")
                        let total = amount * (1 + tipRate / 100)
                        Text(total, format:
                                .currency(code: Locale.current.currency?.identifier ?? "USD" ))
                    }
                    
                    Section("每人平均費用") {
//                        Text("\(amountPerPerson, specifier: "%.2f")")
                        Text(amountPerPerson, format:
                                .currency(code: Locale.current.currency?.identifier ?? "USD" ))
                    }// amountPerPerson
                    
                }// Form
                .navigationTitle("WeSplit")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            holdView = false
                        }
                    }
                }
            }// NavigationView
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
