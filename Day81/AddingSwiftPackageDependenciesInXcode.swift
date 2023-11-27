//
//  AddingSwiftPackageDependenciesInXcode.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/11/27.
//

/// This is a test package for Swift Package Manager, to give folks something to experiment with when working with Xcode’s SPM integration.
/// To try it out in your project:
/// 1. Go to the File menu.
/// 2. Look in the Swift Packages submenu.
/// 3. Choose Add Package Dependency.
/// 4. For the URL enter https://github.com/twostraws/SamplePackage
/// 5. Leave the default rules alone, and click Next.
/// 6. Click Finish to complete the process.


import SwiftUI
import SamplePackage

struct ContentView: View {
    let possibleNumbers = Array(1...60)
    
    var body: some View {
        VStack {
            Text(results)
        }
    }
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let string = selected.map(String.init)
        return string.joined(separator: ", ")
    }
}

#Preview {
    ContentView()
}
