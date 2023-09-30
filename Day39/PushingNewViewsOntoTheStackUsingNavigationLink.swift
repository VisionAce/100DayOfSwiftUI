//
//  PushingNewViewsOntoTheStackUsingNavigationLink.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                List(0..<100) { row in
                    NavigationLink {
                        Text("Detail \(row)")
                    } label: {
                        Text("Row \(row)")
                    }
                    .navigationTitle("SwiftUI")
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
