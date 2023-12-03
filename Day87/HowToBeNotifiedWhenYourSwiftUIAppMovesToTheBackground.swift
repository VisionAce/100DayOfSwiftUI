//
//  HowToBeNotifiedWhenYourSwiftUIAppMovesToTheBackground.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/12/3.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .onChange(of: scenePhase) { oldPhase, newPhase in
                    if newPhase == .active {
                        print("Active")
                    } else if newPhase == .inactive {
                        print("Inactive")
                    } else if newPhase == .background {
                        print("Background")
                    }
                }
                
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
