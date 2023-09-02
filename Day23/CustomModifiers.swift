//
//  CustomModifiers.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/2.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}


struct WaterMark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}


extension View {
    
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    
    func watermarked(with text: String) -> some View {
        modifier(WaterMark(text: text))
    }
}




struct ContentView: View {

    var body: some View {
        VStack {
            Text("Hello World")
                .titleStyle()
            
            Color.gray
                .frame(width: 300, height: 200)
                .watermarked(with: "Hacking with Swift")
            
        }

    }
}
// Tip: Often folks wonder when it’s better to add a custom view modifier versus just adding a new method to ˋViewˋ, and really it comes down to one main reason: custom view modifiers can have their own stored properties, whereas extensions to ˋViewˋ cannot.



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
