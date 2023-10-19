//
//  AcceptingMulti-lineTextInputWithTextEditor.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/10/19.
//

import SwiftUI

struct ContentView: View {
    // Tip: @AppStorage is not designed to store secure information, so never use it for anything private.
    @AppStorage("notes") private var notes = ""
    var body: some View {
        NavigationStack { // However, you do need to be careful to make sure it doesn’t go outside the safe area, otherwise typing will be tricky; embed it in a NavigationView, a Form, or similar.
           TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
