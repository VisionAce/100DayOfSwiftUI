//
//  TransformingShapesUsingCGAffineTransformAndEven-oddFills.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/10/7.
//

import SwiftUI

struct Flower: Shape {
    var petalOffset = -20.0
    var petalWidth = 100.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 4) {
            // rotate the petal by the current value of our loop
            let rotation = CGAffineTransform(rotationAngle: number)
            
            // move the petal to be at the center of our view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            // create a path for this petal using our properties plus a fixed Y and height
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
            
            // apply our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)
            
            // add it to our main path
            path.addPath(rotatedPetal)
            
        }
        return path
    }
}


struct ContentView: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    var body: some View {
        VStack {
            
            Flower(petalOffset: petalOffset,petalWidth: petalWidth)
//                .stroke(.red, lineWidth: 2)
                .fill(.red, style: FillStyle(eoFill: true))
            
            Text("Offest")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            
            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding([.horizontal, .bottom])
     
        }
        .padding()
    
    }
}


#Preview {
    ContentView()
}
