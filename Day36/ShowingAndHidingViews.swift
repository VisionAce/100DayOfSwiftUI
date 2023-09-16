//
//  ShowingAndHidingViews.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/16.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    var body: some View {
        VStack {
            Text("Hello, \(name)!")
            
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    var body: some View {
        VStack {
            Button("Show Sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SecondView(name: "Jeff")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
