//
//  WorkingWithHierarchicalCodableData.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/30.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    var body: some View {
        
        Button("Decode JSON") {
            let input = """
  {
        "name": "Taylor Swift",
        "address": {
            "street": "555, Taylor Swift Avenue",
            "city": "Nashville"
        }
    }
"""
            let data = Data(input.utf8)
            
            if let user = try? JSONDecoder().decode(User.self, from: data) {
                print(user.address.street)
            }
        }
    }
}

#Preview {
    ContentView()
}
