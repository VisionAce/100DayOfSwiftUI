//
//  ControllingImageInterpolationInSwiftUI.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/11/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Image(.example)
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(.black)
            .ignoresSafeArea()
        
    }
}

#Preview {
    ContentView()
}
