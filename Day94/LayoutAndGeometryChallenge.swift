//
//  LayoutAndGeometryChallenge.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/12/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(
                                Color(
                                    hue: mapValue(geo.frame(in: .global).maxY,
                                                  from: 0,
                                                  to:  fullView.size.height),
                                    saturation: 0.8,
                                    brightness: 1)
                            )
                            .rotation3DEffect(
                                .degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5,
                                axis: (x: 0, y: 1, z: 0)
                            )
                            .opacity(
                                mapValue(geo.frame(in: .global).midY,
                                         from: 0,
                                         to:  fullView.size.height,
                                         standard_min: 0.2))
                            .scaleEffect(
                                mapValue(geo.frame(in: .global).midY,
                                         from: 0,
                                         to: fullView.size.height,
                                         standard_min: 0.5,
                                         standard_max: 1.4)
                            )
   
                    }
                    .frame(height: 40)
                }
            }
        }
    }
    
    func mapValue(_ value: Double, from minValue: Double, to maxValue: Double,standard_min: Double = 0.0,standard_max: Double = 1.0) -> Double {
        let normalizedValue = (value - minValue) / (maxValue - minValue)
        let result = (standard_max - standard_min) * normalizedValue + standard_min
        return max(standard_min, min(standard_max, result))
    }
}

#Preview {
    ContentView()
}

