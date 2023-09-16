//
//  StoringUserSettingsWithUserDefaults.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/16.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    var body: some View {
        VStack {
            Button("Tap count: \(tapCount)") {
                tapCount += 1
                UserDefaults.standard.set(tapCount, forKey: "Tap")
            }
        }
        .padding()
    }
    
}


struct ContentView2: View {
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        VStack {
            Button("Tap count: \(tapCount)") {
                tapCount += 1
            }
        }
        .padding()
    }
    
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
