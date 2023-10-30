//
//  HowPropertyWrappersBecomeStructs&RespondingToStateChangesUsingOnChange().swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/10/30.
//

// MARK: -
// @frozen @propertyWrapper public struct State<Value> : DynamicProperty {
//1. command + shift + o 可快速查@State,由文件中可知(上述)，@State本身也是個struct
//2. public var wrappedValue: Value { get nonmutating set }
//   > That wrapped value is the actual value we’re trying to store, such as a string. What this generated interface is telling us is that the property can be read (get), and written (set), but that when we set the value it won’t actually change the struct itself. Behind the scenes, it sends that value off to SwiftUI for storage in a place where it can be modified freely, so it’s true that the struct itself never changes.
//3. changing the property directly using a button works fine, because it goes through the nonmutating setter and triggers the didSet observer, but using a binding doesn’t because it bypasses the setter and adjusts the value directly.
//4. 可透過onChange()來解決上述無法查看Slider中binding的值(blurAmount)
// MARK: -

import SwiftUI

struct ContentView: View {
    @State private var blurAmount = 0.0
//    {
//        didSet {
//            print("New value is \(blurAmount)")
//        }
//    }
    var body: some View {
        VStack {
    
            Text("Hello, world!")
                .font(.largeTitle)
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
            
            Button("Random Blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
        .padding()
        .onChange(of: blurAmount) {
            print("New value is \(blurAmount)")
        }
    }
}

#Preview {
    ContentView()
}
