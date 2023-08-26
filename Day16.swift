//
//  Day16.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/8/26.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
   
    var body: some View {
        
        NavigationView {
            Form {
                Picker ("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self){
                        Text($0)
                    }
                }
            }
            .navigationTitle("Student")
            .pickerStyle(.navigationLink)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
