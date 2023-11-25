//
//  CustomPropertyWrappers.swift
//  MyPhoto
//
//  Created by 褚宣德 on 2023/11/23.
//

import SwiftUI

@propertyWrapper
struct NonNegative<Value: BinaryInteger> {
    var value: Value
    
    init(wrappedValue: Value) {
        if wrappedValue < 0 {
            value = 0
        } else {
            value = wrappedValue
        }
    }
    
    var wrappedValue: Value {
        get { value }
        set {
            if newValue < 0 {
                value = 0
            } else {
                value = newValue
            }
        }
    }
}

struct User {
    @NonNegative var score = 0
}


struct CustomPropertyWrappersView: View {
    @State private var example = NonNegative(wrappedValue: 5)
    @State private var user = User()
    
    var body: some View {
        Form {
            Section {
                Text("NonNegative: 5 - 10")
                Text("Result: \(example.wrappedValue)")
            }
            
            Section {
                Button("NonNegative +10"){
                    user.score += 10
                }
                Button("NonNegative -20"){
                    user.score -= 20
                }
                
                Text("\(user.score)")
            }
        }
        .onAppear {
            example.wrappedValue -= 10
        }
    }
}

#Preview {
    CustomPropertyWrappersView()
}
