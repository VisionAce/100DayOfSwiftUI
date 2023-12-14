//
//  ScrollViewEffectsUsingGeometryReader.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/12/14.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % 7])
                            .rotation3DEffect(
                                .degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5,
                                axis: (x: 0, y: 1, z: 0)
                            )
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

struct ContentView2: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(0..<20) { num in
                    GeometryReader { geo in
                        Text("Number: \(num)")
                            .font(.title)
                            .padding()
                            .background(.red)
                            .rotation3DEffect(
                                .degrees(-geo.frame(in: .global).minX) / 8,
                                axis: (x: 0, y: 1, z: 0)
                            )
                    }
                    .frame(width: 200, height: 100)
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
