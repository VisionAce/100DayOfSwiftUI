//
//  ReadingCustomValuesFromTheEnvironmentWith@EnvironmentObject.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/11/26.
//

import SwiftUI

@MainActor class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    var body: some View {
        Text(user.name)
    }
}

struct ContentView: View {
    @StateObject var user = User()
    var body: some View {
        VStack {
            EditView()
            DisplayView()
        }
        .environmentObject(user)
    }
}

#Preview {
    ContentView()
}
