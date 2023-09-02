//
//  ViewsAsProperties.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/2.
//

import SwiftUI

struct ContentView: View {
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    var motto3: some View {
        Text("Harry Potter")
    }
    
    // This is often a great way to carve up your complex views into smaller chunks, but be careful: unlike the body property, Swift won’t automatically apply the @ViewBuilder attribute here, so if you want to send multiple views back you have three options.
    
    // First, you can place them in a stack, like this:
    var spells: some View {
        VStack {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    // If you don’t specifically want to organize them in a stack, you can also send back a Group. When this happens, the arrangement of your views is determined by how you use them elsewhere in your code:
    var spells2: some View {
        Group {
            Text("Lumos 2")
            Text("Obliviate 2")
        }
    }
    
    // The third option is to add the @ViewBuilder attribute yourself, like this:
    // Paul比較喜歡這樣用
    @ViewBuilder var spells3: some View {
            Text("Lumos 3")
            Text("Obliviate 3")
    }
    
    
    var body: some View {
        
        VStack {
            Spacer()
            
            motto1
                .foregroundColor(.red)
            
            Spacer()
            
            motto2
                .foregroundColor(.indigo)
            
            Spacer()
            
            motto3
            
            Spacer()
            
            spells3
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
