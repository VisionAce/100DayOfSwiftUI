//
//  ContentView.swift
//  HotProspects
//
//  Created by 褚宣德 on 2023/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var prospects = Prospects()
    
    var body: some View {
            TabView {
                ProspectsView(filter: .none)
                    .tabItem {
                        Label("Everyone", systemImage: "person.3")
                    }
                
                ProspectsView(filter: .contacted)
                    .tabItem {
                        Label("Contacted", systemImage: "checkmark.circle")
                    }
                
                ProspectsView(filter: .uncontacted)
                    .tabItem {
                        Label("Uncontacted", systemImage: "questionmark.diamond")
                    }
                
                MeView()
                    .tabItem {
                        Label("Me", systemImage: "person.crop.square")
                    }
            }
            .environmentObject(prospects)

    }
}

#Preview {
    ContentView()
}
