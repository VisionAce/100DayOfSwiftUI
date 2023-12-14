# Day 93: Projects 18: LayoutAndGeometry

Follow along at 
- [Day 93 – Project 18, part two][1]

# 📒 Field Notes

Focus on several topic:
- Absolute positioning for SwiftUI views
- Understanding frames and coordinates inside GeometryReader
- ScrollView effects using GeometryReader
 
 
## Absolute positioning for SwiftUI views

- position()
- offset()
- background()


## Understanding frames and coordinates inside GeometryReader

- GeometryReader

- .coordinateSpace(name: )

Which coordinate space you want to use depends on what question you want to answer:

 - Want to know where this view is on the screen? Use the global space.
 - Want to know where this view is relative to its parent? Use the local space.
 - What to know where this view is relative to some other view? Use a custom space.

 global space上比下高，右比左寬
 
<img width="300" height="600" src="https://github.com/VisionAce/Screenshoots/blob/main/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202023-12-14%20at%2015.36.27.png"/>



## ScrollView effects using GeometryReader
- ScrollView
- .rotation3DEffect()

<img width="300" height="600" src="https://github.com/VisionAce/Screenshoots/blob/main/Simulator%20Screen%20Recording%20-%20iPhone%2015%20Pro%20-%202023-12-14%20at%2016.10.51.gif"/>

<img width="300" height="600" src="https://github.com/VisionAce/Screenshoots/blob/main/Simulator%20Screen%20Recording%20-%20iPhone%2015%20Pro%20-%202023-12-14%20at%2016.14.16.gif"/>


[1]: https://www.hackingwithswift.com/100/swiftui/93
