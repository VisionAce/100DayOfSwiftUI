//
//  EnvironmentModifiers.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/2.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack {
            Text("Gryffindor")
            // There, font() is an environment modifier, which means the Gryffindor text view can override it with a custom font.
                .font(.largeTitle)
            // blur() is a regular modifier, so any blurs applied to child views are added to the VStack blur rather than replacing it.
                .blur(radius: 0)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title)
        .blur(radius: 5)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
