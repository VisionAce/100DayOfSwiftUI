//
//  CreativeBordersAndFillsUsingImagePaint.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/10/7.
//

import SwiftUI

struct ContentView: View {
  
    var body: some View {
        VStack {
            
            Image(systemName: "mic")
                .resizable()
                .frame(width: 300, height: 200)
            
            
            Text("Hello, world")
                .frame(width: 300, height: 200)
                .border(ImagePaint(image: Image(systemName: "mic"), scale: 0.2), width: 30)
      
            Capsule()
                .strokeBorder(ImagePaint(image: Image(systemName: "mic"), sourceRect: CGRect(x: 0, y: 0.4, width: 1, height: 0.5), scale: 0.1), lineWidth: 20)
                .frame(width: 300, height: 200)

        }
        .padding()
    }
}


#Preview {
    ContentView()
}
