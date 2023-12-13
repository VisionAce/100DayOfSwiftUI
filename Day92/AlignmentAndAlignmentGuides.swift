//
//  AlignmentAndAlignmentGuides.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/12/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            Text("Live")
                .font(.caption)
            Text("long")
            Text("and")
                .font(.title)
            Text("prosper")
                .font(.largeTitle)
            
        }
    }
}

struct ContentView2: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello, World!")
                .alignmentGuide(.leading) { dimension in
                    dimension[.trailing]
                }
            
            Text("Hello, World!")
                .alignmentGuide(.leading) { _ in
                    0
                }
            Text("Hello, World2!")
                .alignmentGuide(.leading) { _ in
                    30
                }
            Text("Hello, World!")
                .offset(x: -200, y: 0)
            
            Text("This is a longner line of text")
        }
        .background(.red)
        .frame(width: 400, height: 400)
        .background(.blue)
    }
}


struct ContentView3: View {
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<10) { position in
                Text("Number \(position)")
                    .alignmentGuide(.leading) { _ in
                        Double(position) * -10
                    }
            }
        }
        .background(.red)
        .frame(width: 400, height: 400)
        .background(.blue)
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
