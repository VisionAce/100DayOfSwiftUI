# Day 96: Project 19: SnowSeeker

Follow along at 
- [Day 96 – Project 19, part one][1]

# 📒 Field Notes

Focus on several topic:

- Working with two side by side views in SwiftUI
- Using alert() and sheet() with optionals
- Using groups as transparent layout containers
- Making a SwiftUI view searchable
 
 
## Working with two side by side views in SwiftUI

NavigationView iOS 13.0–17.0 Deprecated，取而代之的是用：
- NavigationStack
- NavigationSplitView


## Using alert() and sheet() with optionals

- [.sheet(item: ) { }] [2]
- [.alert("", isPresented: , presenting: ) { }][3]


## Using groups as transparent layout containers

- Group
  - used to work around the 10-child view limit
  - it acts as a transparent layout container

- @Environment(\.horizontalSizeClass) var sizeClass
two size classes horizontally and vertically
  - compact
  - regular


## Making a SwiftUI view searchable

- searchable()
- contains() 
- localizedCaseInsensitiveContains()


[1]: https://www.hackingwithswift.com/100/swiftui/96
[2]: 
[3]:
