//
//  CreatingImplicitAnimations.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/12.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    var body: some View {
        VStack {
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            .blur(radius: (animationAmount - 1) * 3)
            .animation(.default, value: animationAmount)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
