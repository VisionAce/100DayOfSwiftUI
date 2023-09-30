//
//  HowToLayOutViewsInAScrollingGrid.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/30.
//

import SwiftUI

struct ContentView: View {
    let layout = [
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80))
    ]
    
    let layout2 = [
        GridItem(.adaptive(minimum: 80,maximum: 120))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct ContentView2: View {
    let layout = [
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80))
    ]
    
    let layout2 = [
        GridItem(.adaptive(minimum: 80,maximum: 120))
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout2) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

#Preview("ContentView2") {
    ContentView2()
}
