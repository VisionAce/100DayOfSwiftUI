//
//  SupportingSpecificAccessibilityNeedsWithSwiftUI.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/12/3.
//


import SwiftUI

/// UIKit’s UIAccessibility
func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct ContentView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    var body: some View {
        HStack {
            if differentiateWithoutColor {
                Image(systemName: "checkmark.circle")
            }
            Text("Success")
        }
        .padding()
        .background(differentiateWithoutColor ? .black : .green)
        .foregroundStyle(.white)
        .clipShape(Capsule())
    }
}

struct ContentView2: View {
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale = 1.0
    var body: some View {
        Text("Hello, world!")
            .scaleEffect(scale)
            .onTapGesture {
//                if reduceMotion {
//                    scale *= 1.5
//                } else {
//                    withAnimation {
//                        scale *= 1.5
//                    }
//                }
                withOptionalAnimation {
                    scale *= 1.5
                }
            }
    }
}

struct ContentView3: View {
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    var body: some View {
        Text("Hello world!")
            .padding()
            .background(reduceTransparency ? .black : .black.opacity(0.5))
            .foregroundStyle(.white)
            .clipShape(Capsule())
    }
}


#Preview {
    ContentView()
}
