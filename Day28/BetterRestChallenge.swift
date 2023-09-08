//
//  BetterRestChallenge.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/8.
//

import CoreML
import SwiftUI

struct SectionTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(Gradient(colors: [.orange, .indigo]))
    }
}

extension View {
    func sectionTitleModifier() -> some View {
        modifier(SectionTitle())
    }
}

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 0
    
    @State private var isReset = false
    
    
    // why use static? --- we can make defaultWakeTime a static variable, which means it belongs to the ContentView struct itself rather than a single instance of that struct. This in turn means defaultWakeTime can be read whenever we want, because it doesn’t rely on the existence of any other properties.
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    // Day28 Challenge 3
    var calculateBedtime: String {
        if !(wakeUp == ContentView.defaultWakeTime && sleepAmount == 8.0 && coffeeAmount == 0) {
            do {
                let config = MLModelConfiguration()
                let model = try SleepCalculator(configuration: config)
                
                let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
                let hour = (components.hour ?? 0) * 60 * 60
                let minute = (components.minute ?? 0) * 60
                
                let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
                
                let sleepTime = wakeUp - prediction.actualSleep
                
                return "Your ideal bedtime is...\n \(sleepTime.formatted(date: .omitted, time: .shortened))"
            } catch {
                return "Error!\nSorry, there was a problem calculating  your bedtime."
            }
        } else {
            return ""
        }
        
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                // Day28 Challenge 1
                Section {
                    HStack {
                        Spacer()
                        DatePicker("", selection: $wakeUp, displayedComponents:
                                .hourAndMinute)
                        .labelsHidden()
                        Spacer()
                    }
                } header: {
                    Text("When Do you want to wake up?")
                        .sectionTitleModifier()
                    
                    
                }
                // Day28 Challenge 1
                Section {
                    VStack (alignment: .leading, spacing: 0) {
                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12,step: 0.25)
                    }
                } header: {
                    Text("Desired amount of sleep")
                        .sectionTitleModifier()
                }
                // Day28 Challenge 1
                Section {
                    // Day28 Challenge 2
                    Picker("Coffee",selection: $coffeeAmount) {
                        ForEach(1..<21) {
                            Text("\($0) cup" + "\($0 > 1 ? "s" : "")")
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                    
                } header: {
                    Text("Daily coffee intake")
                        .sectionTitleModifier()
                }
                Section {
                    Text(calculateBedtime)
                        .font(.headline)
                        .foregroundStyle(.blue)
                } header: {
                    Text("suggestion")
                        .sectionTitleModifier()
                }
                
            } // Form
            .navigationTitle("BetterRest")
            .toolbar {
                Button {
                    isReset = true
                } label: {
                    Image(systemName: "gear")
                    Text("Reset")
                }
            }
            .alert("Reset", isPresented: $isReset) {
                Button("確定") {
                    reset()
                }
                Button("取消") { }
            } message: {
                Text("請問要重置所有設定嗎？")
            }
        }// NavigationView
    }
    
    func reset() {
        wakeUp = ContentView.defaultWakeTime
        sleepAmount = 8.0
        coffeeAmount = 0
        isReset = false
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
