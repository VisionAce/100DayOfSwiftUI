//
//  CustomizingAnimationsInSwiftUI.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/12.
//

import SwiftUI

struct ButtonMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
    }
}

extension View {
    func buttonModifier() -> some View {
        modifier(ButtonMod())
    }
}

struct ContentView: View {
    @State private var animationAmount = 1.0
    var body: some View {
        
        Button("Tap Me") {
            animationAmount += 1
        }
        .buttonModifier()
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        // 彈簧、心跳感
        .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
        
        Button("Tap Me 2") {
            animationAmount += 1
        }
        .buttonModifier()
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        // 緩入緩出
        .animation(
            .easeInOut(duration: 2)
            .delay(1),
            value: animationAmount)
        
        Button("Tap Me 3") {
            animationAmount += 1
        }
        .buttonModifier()
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        // 緩入緩出,變化
        .animation(
            .easeInOut(duration: 1)
            // up , down , up
                .repeatCount(3,autoreverses: true),
            value: animationAmount)
        
        Button("Tap Me 4") {
            animationAmount += 1
        }
        .buttonModifier()
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        // 緩入緩出,變化_重複
        .animation(
            .easeInOut(duration: 1)
            .repeatForever(autoreverses: true),
            value: animationAmount)
        
        
        Button("Tap Me 5") {
//            animationAmount += 1
        }
        .buttonModifier()
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: animationAmount)
        )
        .onAppear {
            animationAmount = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
