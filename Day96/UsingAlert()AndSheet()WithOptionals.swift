//
//  UsingAlert()AndSheet()WithOptionals.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/12/18.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}


struct ContentView: View {
    @State private var slectedUser: User? = nil
    
    var body: some View {
        
        Text("Hello, world!")
            .onTapGesture {
                slectedUser = User()
            }
            .sheet(item: $slectedUser) { user in
                Text(user.id)
            }
        
    }
}

struct ContentView2: View {
    @State private var slectedUser: User? = nil
    @State private var showing = false
    
    var body: some View {
        
        Text("Hello, world!")
            .onTapGesture {
                slectedUser = User()
                showing = true
            }
            .alert("Welcome", isPresented: $showing, presenting: slectedUser) { user in
                Button(user.id) { }
            }
        
    }
}



#Preview {
    ContentView()
}
#Preview("ContentView2") {
    ContentView2()
}
