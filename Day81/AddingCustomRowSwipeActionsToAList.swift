//
//  AddingCustomRowSwipeActionsToAList.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/11/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button(role: .destructive) {
                        print("Deletimg")
                    } label: {
                        Label("Delete", systemImage: "minus.circle")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button {
                        print("Pinning")
                    } label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.orange)
                }
        }
      
    }
}

#Preview {
    ContentView()
}
