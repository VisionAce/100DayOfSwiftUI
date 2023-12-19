# Day 97: Project 19: SnowSeeker

Follow along at 
- [Day 96 – Project 19, part one][1]

# 📒 Field Notes

Focus on several topic:

- Building a primary list of items
- Making NavigationView work in landscape
- Creating a secondary view for NavigationView
- Searching for data in a List
 
 
## Building a primary list of items

- extension Bundle
- let resorts: [Resort] = Bundle.main.decode("resorts.json")
- .overlay()


## Making NavigationView work in landscape

use **NavigationStack** instead of **NavigationView**


## Creating a secondary view for NavigationView

      NavigationLink {
          ResortView(resort: resort)
      } label: {

- joined(separator:)
- Text(resort.facilities, format: .list(type: .and))


## Searching for data in a List

- @State private var searchText = ""
- .searchable(text: $searchText, prompt: "Search for a resort")
- localizedCaseInsensitiveContains()


## 📸 Screenshots

<img width="300" height="600" src="https://github.com/VisionAce/Screenshoots/blob/main/Simulator%20Screen%20Recording%20-%20iPhone%2015%20Pro%20Max%20-%202023-12-19%20at%2016.26.23.gif"/>

[1]: https://www.hackingwithswift.com/100/swiftui/97
