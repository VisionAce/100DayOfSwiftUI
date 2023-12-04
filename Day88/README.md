# Day 88: Projects 17: Flashzilla

Follow along at 
- [Day 88 – Project 17, part three][1]

# 📒 Field Notes

Focus on several topic:
- Designing a single card view
- Building a stack of cards
- Moving views with DragGesture and offset()
 
 
## Designing a single card view

- RoundedRectangle()
- .multilineTextAlignment(.center)
- onTapGesture()


## Building a stack of cards

adding this property to ContentView:

    @State private var cards = [Card](repeating: Card.example, count: 10)

- [create a new **stacked()** modifier][2]
- .ignoresSafeArea()


## Moving views with DragGesture and offset()

- .rotationEffect()
- .offset(x: , y: )
- .abs()
- .opacity()
- [.gesture()][3]
- add this new property to **CardView** below its existing **card** property:

      var removal: (() -> Void)? = nil
  
  - [removal?()][4]
Tip: That question mark in there means the closure will only be called if it has been set.

  - [func removeCard(at index: Int)][5]

[1]: https://www.hackingwithswift.com/100/swiftui/88
[2]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/401b66f2c3cccd3a241b97485bc74c0d77e3c9b0/Day88/ContentView.swift#L10C1-L15C2
[3]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/401b66f2c3cccd3a241b97485bc74c0d77e3c9b0/Day88/CardView.swift#L40C1-L52C10
[4]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/401b66f2c3cccd3a241b97485bc74c0d77e3c9b0/Day88/CardView.swift#L12
[5]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/401b66f2c3cccd3a241b97485bc74c0d77e3c9b0/Day88/ContentView.swift#L30
