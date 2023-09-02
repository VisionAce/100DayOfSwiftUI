//
//  ViewComposition.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/2.
//

import SwiftUI


struct CapsuleText: View {
    var text: String
    var body: some View{
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.yellow)
            .clipShape(Capsule())
    }
}


struct ContentView: View {

    var body: some View {
        
        VStack(spacing: 10) {
            Text("First")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.indigo)
                .background(.yellow)
                .clipShape(Capsule())
            
            Text("Second")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.indigo)
                .background(.yellow)
                .clipShape(Capsule())
            
            CapsuleText(text: "Third")
                .foregroundColor(.white)
            CapsuleText(text: "Fourth")
                .foregroundColor(.brown)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
