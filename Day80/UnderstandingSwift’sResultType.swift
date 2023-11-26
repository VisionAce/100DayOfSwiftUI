//
//  UnderstandingSwift’sResultType.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/11/27.
//

import SwiftUI

struct ContentView: View {
    @State private var output = ""
    
    var body: some View {
        VStack {
          Text(output)
                .task {
                    await fetchReadings()
                }
        }
        .padding()
    }
    
    func fetchReadings() async {
        let fetchTask = Task { () -> String in
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings."
        }
        
        let result = await fetchTask.result
        
        switch result {
        case .success(let str):
            output = str
        case .failure(let error):
            output = "Download error: \(error.localizedDescription)"
        }
    }
}

#Preview {
    ContentView()
}
