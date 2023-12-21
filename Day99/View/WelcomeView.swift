//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by 褚宣德 on 2023/12/19.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        Text("Welcome to SnowSeeker!")
            .font(.largeTitle)
        
        Text("Please select a resort from the left-hand menu; swope from the left edge to show it.")
            .foregroundStyle(.secondary)
    }
}

#Preview {
    WelcomeView()
}
