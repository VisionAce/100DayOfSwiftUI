//
//  IdentifyingViewsWithUsefulLabels.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/11/18.
//

import SwiftUI

struct ContentView: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "Forzen tree buds",
        "Sunflowers",
        "Fireworks"
    ]
    
    @State private var selectPicture = Int.random(in: 0...3)
    
    var body: some View {
        VStack {
            Image(pictures[selectPicture])
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    selectPicture = Int.random(in: 0...3)
                }
                .accessibilityLabel(labels[selectPicture])
                .accessibilityAddTraits(.isButton)
                .accessibilityRemoveTraits(.isImage)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
