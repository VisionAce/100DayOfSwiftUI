//
//  Gradients.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/8/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        //LinearGradient
        LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
        
        
        LinearGradient(gradient: Gradient(stops: [
            Gradient.Stop(color: .white, location: 0.45),
            .init(color: .black, location: 0.55)
        ]), startPoint: .top, endPoint: .bottom)
        
        
        // RadialGradient
        RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
        
        // AngularGradient
        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .purple, .indigo, .red]), center: .center)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
