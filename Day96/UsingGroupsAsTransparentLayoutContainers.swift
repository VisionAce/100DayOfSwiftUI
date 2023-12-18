//
//  UsingGroupsAsTransparentLayoutContainers.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/12/18.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna and Arya")
        }
        .font(.title)
    }
}

struct ContentView: View {
    @State private var layoutVertically = false
    var body: some View {
        Group {
            if layoutVertically {
                VStack {
                    UserView()
                }
            } else {
                HStack {
                    UserView()
                }
            }
            
        }
        .onTapGesture {
            layoutVertically.toggle()
        }
        
    }
}

struct ContentView2: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    var body: some View {
        if sizeClass == .compact {
            VStack(content: UserView.init)
        } else {
            HStack (content: UserView.init)
        }
    }
}

#Preview {
    ContentView()
}

#Preview("ContentView2") {
    ContentView2()
}
