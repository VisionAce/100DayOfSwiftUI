//
//  CreatingContextMenus.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/11/27.
//

/// I have a few tips for you when working with context menus, to help ensure you give your users the best experience:
/// 1. If you’re going to use them, use them in lots of places – it can be frustrating to press and hold on something only to find nothing happens.
/// 2. Keep your list of options as short as you can – aim for three or less.
/// 3. Don’t repeat options the user can already see elsewhere in your UI.
import SwiftUI

struct ContentView: View {
    @State private var backgroundColor = Color.red
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
                .background(backgroundColor)
            
            Text("Change Color")
                .padding()
                .contextMenu {
                    Button(role: .destructive) {
                        backgroundColor = .red
                    } label: {
                        Label("Red", systemImage: "checkmark.circle.fill")
                    }
                    
                    Button("Green") {
                        backgroundColor = .green
                    }
                    
                    Button("Blue") {
                        backgroundColor = .blue
                    }
                }
        }
      
    }
}

#Preview {
    ContentView()
}
