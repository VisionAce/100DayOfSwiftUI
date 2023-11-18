//
//  HidingAndGroupingAccessibilityData.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/11/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Your score is 1000")
        

        Image(decorative: "character")
            .resizable()
            .scaledToFit()
            .accessibilityHidden(true)
    }
}

#Preview {
    ContentView()
}
