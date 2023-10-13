//
//  ValidatingAndDisablingForms.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/10/13.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var email = ""
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account...")
                }
            }
            .disabled(disableForm)
        }
 
    }
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
}

#Preview {
    ContentView()
}
