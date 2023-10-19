//
//  CreatingACustomComponentWith@Binding.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/10/19.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(
            LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom)
        )
        .foregroundStyle(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}


struct ContentView: View {
    @State private var rememberMe = false
    var body: some View {
        VStack {
            // That adds a dollar sign before rememberMe – we’re passing in the binding itself, not the Boolean inside it.
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
