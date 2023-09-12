//
//  CreatingExplicitAnimations.swift
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
    @State private var animationAmount = 0.0
    var body: some View {
        Button("Tap Me") {
            // If we just write animationAmount += 360 then the change will happen immediately, because there is no animation modifier attached to the button. This is where explicit animations come in: if we use a withAnimation() closure then SwiftUI will ensure any changes resulting from the new state will automatically be animated.
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                animationAmount += 360
            }
        }
        .buttonModifier()
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
