//
//  TriggeringEventsRepeatedlyUsingATimer.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/12/3.
//

import SwiftUI

struct ContentView: View {
    /// If you need to keep time strictly then leaving off the tolerance parameter will make your timer as accurate as possible, but please note that even without any tolerance the Timer class is still “best effort” – the system makes no guarantee it will execute precisely.
    
    let timer = Timer.publish(every: 1,tolerance: 0, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .onReceive(timer) { time in
                    if counter == 5 {
                        timer.upstream.connect().cancel()
                    } else {
                        print("The time is now \(time)\n\(Date.now)")
                    }
                    counter += 1
                }
        }
    }
}

#Preview {
    ContentView()
}
