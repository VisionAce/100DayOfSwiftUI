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


<img width="300" height="600" src="https://github.com/VisionAce/Screenshoots/blob/main/2023.12.20/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202023-12-20%20at%2016.14.49.png"/>


<img width="300" height="600" src="https://github.com/VisionAce/Screenshoots/blob/main/2023.12.20/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202023-12-20%20at%2016.15.07.png"/>



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
[2]: 
[3]: 
[4]: 
[5]: 
[6]: 
[7]: 
[8]: 
[9]: 
[10]: 
[11]: 
[12]: 
[13]: 
