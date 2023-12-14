//
//  AbsolutePositioningForSwiftUIViews.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/12/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
       
            Text("Hello, world!")
                .background(.red)
                .offset(x: 100, y: 100)
        }
        
    }
}

struct ContentView2: View {
    var body: some View {
        VStack {
       
            Text("Hello, world!")
                .offset(x: 100, y: 100)
                .background(.red)
        }
        
    }
}

struct ContentView3: View {
    var body: some View {
        VStack {
       
            Text("Hello, world!")
                .position(x: 100, y: 100)
                .background(.red)
        }
        
    }
}

struct ContentView4: View {
    var body: some View {
        VStack {
       
            Text("Hello, world!")
                .background(.red)
                .position(x: 100, y: 100)
        }
        
    }
}



#Preview {
    ContentView()
}

#Preview("ContentView2") {
    ContentView2()
}

#Preview("ContentView3") {
    ContentView3()
}

#Preview("ContentView4") {
    ContentView4()
}
