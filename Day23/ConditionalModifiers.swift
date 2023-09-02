//
//  ConditionalModifiers.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/2.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
    
        Button("Hello World") {
            // filp the Boolean between true and false
            useRedText.toggle()
        }
        // W_hat ? T_rue : F_alse
        .foregroundColor(useRedText ? .red : .indigo)
        
     
        if useRedText {
            Button("Hello World 2") {
                // filp the Boolean between true and false
                useRedText.toggle()
            }
            .foregroundColor(.brown)
        } else {
            Button("Hello World 2") {
                // filp the Boolean between true and false
                useRedText.toggle()
            }
            .foregroundColor(.yellow)
        }
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
