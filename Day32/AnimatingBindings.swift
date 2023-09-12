//
//  AnimatingBindings.swift
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
        // non-view code
        print(animationAmount)
        // Because we have some non-view code in there, we need to add ˋreturnˋ before the ˋVStackˋ so Swift understands which part is the view that is being sent back.
        return VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .buttonModifier()
            .scaleEffect(animationAmount)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
