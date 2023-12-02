//
//  DisablingUserInteractivityWithAllowsHitTesting().swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/12/2.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
                }
            
            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Circle tapped!")
                }
                .allowsHitTesting(false)
        }
    }
}

struct ContentView2: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
                }
            
            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .contentShape(Rectangle())
                .onTapGesture {
                    print("Circle tapped!")
                }

        }
    }
}

struct ContentView3: View {
    var body: some View {
        VStack {
            Text("Hellow")
            Spacer().frame(height: 100)
            Text("World!")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("VStack tapped!")
        }
    }
}



#Preview() {
    ContentView()
}


#Preview("ContentView2") {
    ContentView2()
}

#Preview("ContentView3") {
    ContentView3()
}
