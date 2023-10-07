//
//  EnablingHigh-performanceMetalRenderingWithDrawingGroup().swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/10/7.
//

import SwiftUI

struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                        gradient: Gradient(colors: [
                            color(for: value,brightness: 1),
                            color(for: value,brightness: 0.5)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                        ),
                        lineWidth: 2)
            }
        }
        .drawingGroup()
    }
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        // hue is a value from 0 to 1.  hues don’t automatically wrap after we reach 1.0
        if targetHue > 1 {
            targetHue -= 1
        }
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}


struct ContentView: View {
    @State private var colorCycle = 0.0
  
    var body: some View {
        VStack {
            ColorCyclingCircle(amount: colorCycle)
                .frame(width: 300, height: 300)
            
            Text("colorCycle: \(colorCycle,specifier: "%.3f")")
            Slider(value: $colorCycle)

        }
        .padding()
    }
}


#Preview {
    ContentView()
}
