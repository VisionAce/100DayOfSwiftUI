//
//  Day46Challenge.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/10/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    ArrowView()
                } label: {
                    Text("Arrow")
                }
                .padding()
                NavigationLink {
                    ColorCyclingRectangleView()
                } label: {
                    Text("ColorCyclingRectangle")
                }
                .padding()

                
            }
            .navigationTitle("Day46 Challenge")
        }
    }
}


#Preview {
    ContentView()
}
