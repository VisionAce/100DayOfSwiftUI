//
//  CreatingCustomPathsWithSwiftUI.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/10/5.
//

import SwiftUI

struct triangleView: View {
    
    var body: some View {
        
            Path { path in
                path.move(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.addLine(to: CGPoint(x: 200, y: 100))
            }
        
    }

}

struct ContentView: View {
    var body: some View {
        VStack {
            
            Path { path in
                path.move(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.addLine(to: CGPoint(x: 200, y: 100))
            }
            .fill(.blue)
            .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            
        }
        .padding()
    }
}

struct ContentView2: View {
    var body: some View {
        VStack {
            Path { path in
                path.move(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.addLine(to: CGPoint(x: 200, y: 100))
                path.closeSubpath()
            }
            .stroke(.brown, lineWidth: 10)

        }
        .padding()
    }
}
#Preview("triangleView") {
    triangleView()
}


#Preview("ContentView") {
    ContentView()
}

#Preview("ContentView2") {
    ContentView2()
}
