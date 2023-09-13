//
//  ControllingTheAnimationStack.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/13.
//

import SwiftUI

struct ContentView: View {
    @State private var enable = false
    var body: some View {
        
        Button("Tap Me") {
            enable.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enable ? .blue : .red)
        .animation(nil, value: enable)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enable ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enable)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
