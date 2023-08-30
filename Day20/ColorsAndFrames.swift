//
//  ColorsAndFrames.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/8/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      
        ZStack {
            VStack(spacing: 0) {
                Color.indigo
                Color(red: 0.7, green: 0.5, blue: 0.5)
            }
            Text("Your content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
          
        
        }
        .ignoresSafeArea()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
