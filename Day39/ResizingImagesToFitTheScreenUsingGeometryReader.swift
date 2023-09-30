//
//  ResizingImagesToFitTheScreenUsingGeometryReader.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            GeometryReader { geo in
                Image("Example")
                    .resizable()
                    .scaledToFit()
//                    .scaledToFill()
                    .frame(width: geo.size.width * 0.8)
                // Tip: If you ever want to center a view inside a GeometryReader, rather than aligning to the top-left corner, add a second frame that makes it fill the full space of the container, like this:
                    .frame(width: geo.size.width, height: geo.size.height)
                //                .clipped()
            }
        }
}

#Preview {
    ContentView()
}
