//
//  Day19.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/8/29.
//

import SwiftUI

struct ContentView: View {
    @State private var time = 0.0
    @State private var unit = "分"
    @State private var unitConvert = "分"
    @FocusState private var holdView: Bool
    
    let times = ["日", "時", "分", "秒"]
    
    var timeResult: Double {
        // all case
        if unit == unitConvert {
            return time
        }
        else if unit == "分" && unitConvert == "秒" {
            return time * 60
        }
        else if unit == "秒" && unitConvert == "分" {
            return time / 60
        }
        else if unit == "時" && unitConvert == "分" {
            return time * 60
        }
        else if unit == "時" && unitConvert == "秒" {
            return time * 360
        }
        else if unit == "分" && unitConvert == "時" {
            return time / 60
        }
        else if unit == "秒" && unitConvert == "時" {
            return time / 360
        }
        else if unit == "日" && unitConvert == "時" {
            return time * 24
        }
        else if unit == "日" && unitConvert == "分" {
            return time * 24 * 60
        }
        else if unit == "日" && unitConvert == "秒" {
            return time * 24 * 60 * 60
        }
        else if unit == "時" && unitConvert == "日" {
            return time / 24
        }
        else if unit == "分" && unitConvert == "日" {
            return time / (24 * 60)
        }
        else if unit == "秒" && unitConvert == "日" {
            return time / (24 * 60 * 60)
        }
        else {
            return 0
        }
    }
    
    
    var body: some View {
        
        NavigationView {
            Form {
                Section("你渴望有多少時間？") {
                    
                    TextField("time", value: $time, format: .number)
                        .keyboardType(.numberPad)
                        .focused($holdView)
                    
                    
                    Picker("單位", selection: $unit) {
                        ForEach(times, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }// time & unit
                
                Section("你的時間將轉化為...") {
                    
                    Text(timeResult, format: .number)
                    
                    
                    Picker("單位", selection: $unitConvert) {
                        ForEach(times, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                }// timeResult & unitConvert
                
            }// Form
            .navigationTitle("時間轉換")
            .toolbar {
                ToolbarItemGroup (placement: .keyboard) {
                    Spacer()
                    Button("完成") {
                        holdView = false
                    }
                }
            }// toolbar
        }// NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
