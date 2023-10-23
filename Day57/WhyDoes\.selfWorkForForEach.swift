//
//  WhyDoes\.selfWorkForForEach.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/10/23.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct ContentView: View {
    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]
    var body: some View {
        VStack {
            List {
                ForEach([2, 4, 6, 8, 10], id: \.self) {
                    Text("\($0) is even")
                }
                
            }
            Section {
                List {
                    ForEach(students, id: \.self) { student in
                        Text(student.name)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
