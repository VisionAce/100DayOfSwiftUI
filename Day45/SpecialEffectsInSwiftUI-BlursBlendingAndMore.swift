//
//  SpecialEffectsInSwiftUI-BlursBlendingAndMore.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/10/8.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // 以下兩種方法效果相同
        VStack {
            // 方法一：
            ZStack {
                Image("Example")
                    .resizable()
                
                Rectangle()
                    .fill(.red)
                    .blendMode(.multiply)
            }
            
            // 方法二：
            Image("Example")
                .resizable()
                .colorMultiply(.red)
        }
        .padding()
    }
}


struct ContentView2: View {
    @State private var amount = 0.0
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color(red: 1, green: 0, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 1, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                
                Circle()
                    .fill(Color(red: 0, green: 0, blue: 1))
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
                
                
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct ContentView3: View {
    @State private var amount = 0.0
    var body: some View {
        VStack {
            Image("Example")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
                .padding()
        }
    }
}

#Preview {
    ContentView()
}

#Preview("ContentView2") {
    ContentView2()
}

#Preview("ContentView3") {
    ContentView3()
}
