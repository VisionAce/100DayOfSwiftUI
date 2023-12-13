# Day 92: Projects 18: LayoutAndGeometry

Follow along at 
- [Day 92 – Project 18, part one][1]

# 📒 Field Notes

Focus on several topic:
- How layout works in SwiftUI
- Alignment and alignment guides
- How to create a custom alignment guide
 
 
## How layout works in SwiftUI

All SwiftUI layout happens in three simple steps:
1. A parent view proposes a size for its child.
2. Based on that information, the child then chooses its own size and the parent must respect that choice.
3. The parent then positions the child in its coordinate space.

Behind the scenes, SwiftUI performs a fourth step: although it stores positions and sizes as floating-point numbers, when it comes to rendering SwiftUI rounds off any pixels to their nearest values so our graphics remain sharp.



## Alignment and alignment guides
- HStack(alignment: .lastTextBaseline)
- alignmentGuide()
  - 正負觀念：以對齊的方向為基準，向其方向為 ＋ ，反向為 - 。
  
  (例如： .leading靠左對齊。所以＋10，就是向左10單位。-10，就是向右10單位。)
  
  - 群組觀念：若畫面屬於同一層View中，對齊的概念為相對的。
  
  [例如][2]：AlignmentAndAlignmentGuides.swift中的ContentView3，Number0為對齊基準，Number9則在Number0的leading方向往其-90單位，也就是基於Number0往右90單位。




## How to create a custom alignment guide

[custom layout guide][3]
- **VerticalAlignment** or **HorizontalAlignment**
  - conforms to the **AlignmentID** protocol
    
   
  


[1]: https://www.hackingwithswift.com/100/swiftui/92
[2]: 
[3]: 
