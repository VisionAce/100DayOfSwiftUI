//
//  WorkingWithDates.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/5.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        VStack {
            Text(Date.now, format: .dateTime.hour().minute())
            
            Text(Date.now, format: .dateTime.day().month().year())
            
            Text(Date.now.formatted(date: .long, time: .shortened))
            
            Text(Date.now.formatted(date: .long, time: .omitted))
        }
    }

    func trivialExample() {
        let now = Date.now
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = Date.now...tomorrow
    }
    
    func trivialExample2() {
      var components = DateComponents()
        components.hour = 8
        components.minute = 0
        // because of difficulties around date validation, that date(from:) method actually returns an optional date, so it’s a good idea to use nil coalescing to say “if that fails, just give me back the current date”, like this:
        let date = Calendar.current.date(from: components) ?? Date.now
    }
    
    func trivialExample3() {
        var components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0

        let date = Calendar.current.date(from: components) ?? Date.now
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
