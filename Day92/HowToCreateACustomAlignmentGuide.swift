//
//  HowToCreateACustomAlignmentGuide.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/12/13.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
        
        
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct ContentView: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@twostraws")
                    .alignmentGuide(.midAccountAndName) { dimension in
                        dimension[VerticalAlignment.center]
                    }
                Image(.rocks)
                    .resizable()
                    .frame(width: 64, height: 64)
                Text("Full name:")
                Text("Full name:")
                Text("Full name:")
                Text("Full name:")
                Text("Full name:")
            }
            
            VStack {
                Text("Full name:")
                Text("Full name:")
                Text("Full name:")
                Text("Full name:")
                Text("Full name:")
                Text("PAUL HUDSON")
                    .alignmentGuide(.midAccountAndName) { dimension in
                        dimension[VerticalAlignment.center]
                    }
                    .font(.largeTitle)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
