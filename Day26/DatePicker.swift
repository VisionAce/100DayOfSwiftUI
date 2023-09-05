//
//  DatePicker.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/5.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    
    var body: some View {
        VStack {
            DatePicker("Please enter a date", selection: $wakeUp)
                .labelsHidden()
            
            DatePicker("Please enter a date",
                       selection: $wakeUp,
                       displayedComponents: .date)
            
            
            DatePicker("Please enter a date",
                       selection: $wakeUp,
                       displayedComponents: .hourAndMinute)
            
            
            DatePicker("Please enter a date",
                       selection: $wakeUp,
                       in: Date.now...)
            
            
        }
    }
    // we’ve been using ranges for a while now, and you’re used to seeing things like 1...5 or 0..<10, but we can also use Swift dates with ranges. For example:
    func exampleDates() {
        // creat a second Date instance set to one day in seconds from now
        let tomorrow = Date.now.addingTimeInterval(86400)
        
        // creat a range from those two
        let range = Date.now...tomorrow
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
