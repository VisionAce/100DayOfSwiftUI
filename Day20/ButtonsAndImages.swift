//
//  ButtonsAndImages.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/8/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Button("Delete Selection",role: .destructive, action: executeDelete)
        
        VStack {
            Button("Button 1") { }
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
        }
        
        
        Button {
            print("Button was tapped!")
        } label: {
            Image(systemName: "pencil")
            Text("Tap me!")
                .padding()
                .foregroundColor(.white)
                .background(.red)
        }
        
        
        Button {
            print("Edit Button was tapped!")
        } label: {
        Label("Edit", systemImage: "pencil")
        }
//        .RenderingMode(.original)
        
//Tip: If you find that your images have become filled in with a color, for example showing as solid blue rather than your actual picture, this is probably SwiftUI coloring them to show that they are tappable. To fix the problem, use the renderingMode(.original) modifier to force SwiftUI to show the original image rather than the recolored version.
        
        
    }
    func executeDelete() {
        print("Now deleting")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
