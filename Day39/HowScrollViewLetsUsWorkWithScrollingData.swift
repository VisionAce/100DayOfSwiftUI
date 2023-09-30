//
//  HowScrollViewLetsUsWorkWithScrollingData.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/30.
//

import SwiftUI
struct CustomText: View {
    let text: String
    var body: some View {
        Text(text)
    }
    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ContenthorizontalView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}


#Preview {
    ContentView()
}

#Preview("ContenthorizontalView") {
    ContenthorizontalView()
}
