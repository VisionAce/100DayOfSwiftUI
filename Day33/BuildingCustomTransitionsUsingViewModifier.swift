//
//  BuildingCustomTransitionsUsingViewModifier.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/13.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
        //  stops the view from being drawn outside of its rectangular space.
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading),
                  identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}


struct ContentView: View {
    @State private var isShowingRed = false
    var body: some View {
        ZStack {
            
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
            
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
