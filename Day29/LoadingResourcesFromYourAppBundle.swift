//
//  LoadingResourcesFromYourAppBundle.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/9.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        VStack {
            
        }
    }
    func loadFile() {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            // we found the file in our bundle!
            if let fileContents = try? String(contentsOf: fileURL) {
                // we loaded the file into a string!
                fileContents
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
