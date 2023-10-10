//
//  ColorCyclingRectangleView.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/10/10.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 120
    var startX = 0.0
    var startY = 0.0
    var endX = 0.0
    var endY = 0.0
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                        gradient: Gradient(colors: [
                            color(for: value, brightness: 1),
                            color(for: value, brightness: 0.5)
                        ]),
                        startPoint: UnitPoint(x: startX, y: startY),
                        endPoint: UnitPoint(x: endX, y: endY)
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



struct ColorCyclingRectangleView: View {
    @State private var colorCycle = 0.0
    @State private var startX = 0.0
    @State private var startY = 0.0
    @State private var endX = 0.0
    @State private var endY = 0.0
    var body: some View {
        VStack {
            ColorCyclingRectangle(amount: colorCycle,startX: startX, startY: startY, endX: endX, endY: endY)
                .aspectRatio(contentMode: .fit)
            
            Text("colorCycle: \(colorCycle,specifier: "%.3f")")
            Slider(value: $colorCycle)
                .padding([.horizontal, .bottom])
            
            Text("startX: \(colorCycle,specifier: "%.3f")")
            Slider(value: $startX)
                .padding([.horizontal, .bottom])
            
            Text("startY: \(colorCycle,specifier: "%.3f")")
            Slider(value: $startY)
                .padding([.horizontal, .bottom])
            
            Text("endX: \(colorCycle,specifier: "%.3f")")
            Slider(value: $endX)
                .padding([.horizontal, .bottom])
            Text("endY: \(colorCycle,specifier: "%.3f")")
            Slider(value: $endY)
                .padding([.horizontal, .bottom])
        }
    }
}

#Preview("ColorCyclingRectangleView") {
    ColorCyclingRectangleView()
}
