//
//  UsingTouchIDAndFaceIDWithSwiftUI.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/11/12.
//

// MARK: -
/// [Simulator]To take Face ID for a test drive,go to the Features menu:
/// 1. Face ID > Enrolled
/// 2. Face ID > Matching Face or Non-matching Face


import LocalAuthentication
import SwiftUI

struct ContentView: View {
    @State private var isUnlock = false
    
    var body: some View {
        VStack {
            if isUnlock {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    isUnlock = true
                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics
        }
    }
}

#Preview {
    ContentView()
}
