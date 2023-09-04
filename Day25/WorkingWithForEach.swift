//
//  WorkingWithForEach.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/4.
//

import SwiftUI

struct ContentView: View {
    let agents = ["Cyril", "Lana", "Pam", "Sterling"]
    
    var body: some View {
        VStack {
            Form {
                Section {
                    ForEach(0..<6) { number in
                        Text("Row\(number)")
                    }
                }
                Section {
                    ForEach(0..<agents.count) {
                        Text(agents[$0])
                    }
                }
                
                ForEach(agents, id: \.self) {
                    Text($0)
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
