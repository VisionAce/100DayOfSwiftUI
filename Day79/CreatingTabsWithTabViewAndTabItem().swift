//
//  CreatingTabsWithTabViewAndTabItem().swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/11/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Tab 1\n\(selectedTab)")
                .onTapGesture {
                    selectedTab = "Two"
                }
                .tabItem {
                    Label("One", systemImage: "star")
                }
                .tag("One")
            Text("Tab 2\n\(selectedTab)")
                .onTapGesture {
                    selectedTab = "One"
                }
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .tag("Two")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
