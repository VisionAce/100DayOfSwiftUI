//
//  ArrowView.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/10/10.
//

import SwiftUI

struct Arrow: Shape {
    var headAmount: Double
    var animatableData: Double {
        get { headAmount }
        set { headAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX + headAmount, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX - headAmount, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX + (headAmount + 50), y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX + (headAmount + 50), y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - (headAmount + 50), y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - (headAmount + 50), y: rect.midY))
         
        return path
    }
}

struct ArrowView: View {
    @State private var headAmount = 50.0
    var body: some View {
        VStack {
            MagnifyAndRotation() { // 透過縮放手勢,改變形狀大小與方向(Tip: 在Arrow按住 option + 游標控制)
                Arrow(headAmount: headAmount)
                    .fill(.indigo)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            headAmount = Double.random(in: 50...130)
                        }
                    }
            }
            Text("headAmount:\(headAmount, specifier: "%.2f")")
            Slider(value: $headAmount,in: 50...130)
                .padding([.horizontal, .bottom])
        }
    }
}

#Preview("ArrowView") {
    ArrowView()
}
