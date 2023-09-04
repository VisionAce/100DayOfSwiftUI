//
//  WorkingWithBindings.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/4.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    @State var agreeToTerms = false
    @State var agreeToPrivacyPolicy = false
    @State var agreeToEmails = false
    
    var body: some View {
        Form {
            Section {
                let binding = Binding(
                    get: {selection},
                    set: {selection = $0}
                )
                
                VStack {
                    Picker("Select a number", selection: binding) {
                        ForEach(0..<3) {
                            Text("Item \($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            
            
            Section {
                let agreedToAll = Binding<Bool>(
                    get: {
                        agreeToTerms && agreeToPrivacyPolicy && agreeToEmails
                    },
                    set: {
                        agreeToTerms = $0
                        agreeToPrivacyPolicy = $0
                        agreeToEmails = $0
                    }
                )
                
                VStack {
                    Toggle("Agree to terms", isOn: $agreeToTerms)
                    Toggle("Agree to privacy policy", isOn: $agreeToPrivacyPolicy)
                    Toggle("Agree to receive shipping emails", isOn: $agreeToEmails)
                    Toggle("Agree to all", isOn: agreedToAll)
                }
                
            }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
