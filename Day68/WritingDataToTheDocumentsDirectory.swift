//
//  WritingDataToTheDocumentsDirectory.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/11/11.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .onTapGesture {
                    let str = "Test Message"
                    let url = FileManager.documentsDirectory.appendingPathComponent("Message.txt")
                    
                    do {
                        try str.write(to: url, atomically: true, encoding: .utf8)
                        let input = try String(contentsOf: url)
                        print(input)
                    } catch {
                        print(error.localizedDescription)
                    }
                }

        }
        .padding()
    }
    
//    func getDocumentsDirectory() -> URL {
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        return paths[0]
//    }
    
}

#Preview {
    ContentView()
}
