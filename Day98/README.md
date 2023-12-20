# Day 98: Project 19: SnowSeeker

Follow along at 
- [Day 98 – Project 19, part three][1]

# 📒 Field Notes

Focus on several topic:

- Changing a view’s layout in response to size classes
- Binding an alert to an optional string
- Letting the user mark favorites
 
 
## Changing a view’s layout in response to size classes

- [@Environment(\.horizontalSizeClass) var sizeClass][2]
- [@Environment(\.dynamicTypeSize) var typeSize][3]
- [.dynamicTypeSize(...DynamicTypeSize.xxxLarge)][4]


<img width="300" height="600" src="https://github.com/VisionAce/Screenshoots/blob/main/2023.12.20/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202023-12-20%20at%2016.14.49.png"/> <img width="300" height="600" src="https://github.com/VisionAce/Screenshoots/blob/main/2023.12.20/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202023-12-20%20at%2016.15.07.png"/>



## Binding an alert to an optional string

- [Facility.swift][5]
- [facilities.map(Facility.init)][6]
- [ResortView 顯示facility的icon][7]
- [.alert()][8]


<img width="300" height="600" src="https://github.com/VisionAce/Screenshoots/blob/main/2023.12.20/Simulator%20Screen%20Recording%20-%20iPhone%2015%20Pro%20-%202023-12-20%20at%2016.21.32.gif"/>


## Letting the user mark favorites
- [Favorites.swift][9]
- saving any changes to UserDefaults
- [objectWillChange][10]
- [@StateObject var favorites = Favorites()][11]
- [.environmentObject(favorites)][12]
- [@EnvironmentObject var favorites: Favorites][13]



<img width="300" height="600" src="https://github.com/VisionAce/Screenshoots/blob/main/2023.12.20/Simulator%20Screen%20Recording%20-%20iPhone%2015%20Pro%20-%202023-12-20%20at%2016.27.40.gif"/>


[1]: https://www.hackingwithswift.com/100/swiftui/98
[2]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/7dede7210f4ef248ae46218198a680a0c2184db2/Day98/ResortView.swift#L13
[3]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/7dede7210f4ef248ae46218198a680a0c2184db2/Day98/ResortView.swift#L14
[4]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/7dede7210f4ef248ae46218198a680a0c2184db2/Day98/ResortView.swift#L42
[5]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/main/Day98/Facility.swift
[6]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/7dede7210f4ef248ae46218198a680a0c2184db2/Day98/Resort.swift#L23C1-L25C6
[7]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/7dede7210f4ef248ae46218198a680a0c2184db2/Day98/ResortView.swift#L52C1-L61C26
[8]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/7dede7210f4ef248ae46218198a680a0c2184db2/Day98/ResortView.swift#L81C1-L84C10
[9]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/main/Day98/Favorites.swift
[10]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/7dede7210f4ef248ae46218198a680a0c2184db2/Day98/Favorites.swift#L24
[11]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/7dede7210f4ef248ae46218198a680a0c2184db2/Day98/ContentView.swift#L13
[12]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/7dede7210f4ef248ae46218198a680a0c2184db2/Day98/ContentView.swift#L54
[13]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/7dede7210f4ef248ae46218198a680a0c2184db2/Day98/ResortView.swift#L19
