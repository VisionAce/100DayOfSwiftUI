# Day 99: Project 19: SnowSeeker

Follow along at 
- [Day 99 – Project 19, part four][1]

# 📒 Field Notes

Challenge
 
 
## Challenge 1

>Add a photo credit over the ResortView image. The data is already loaded from the JSON for this purpose, so you just need to make it look good in the UI.

- [.overlay( Text(resort.imageCredit),alignment: .bottomTrailing)][2]

<img width="300" height="600" src="https://github.com/VisionAce/Screenshoots/blob/main/2023.12.21/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202023-12-21%20at%2019.27.09.png"/>


## Challenge 2

>Fill in the loading and saving methods for Favorites.

      let defaults = UserDefaults.standard
      
- init()

      // load our saved data
      if let favorites = defaults.array(forKey: saveKey) as? [String] {
          resorts = Set(favorites)
      } else {
          resorts = []
      }

- func save() 

      // write out our data
      defaults.set(Array(resorts), forKey: saveKey)


<img width="300" height="600" src="https://github.com/VisionAce/Screenshoots/blob/main/2023.12.21/Simulator%20Screen%20Recording%20-%20iPhone%2015%20Pro%20-%202023-12-21%20at%2019.33.22.gif"/>


## Challenge 3
>For a real challenge, let the user sort the resorts in ContentView either using the default order, alphabetical order, or country order.

**ContentView.swift**

- enum SortType

      enum SortType {
          case none, nameSort, countrySort, runsSort
      }
      
- [var sortresorts: [Resort] { }][3]

- [var filteredResorts: [Resort] { }][4]

<img width="300" height="600" src="https://github.com/VisionAce/Screenshoots/blob/main/2023.12.21/Simulator%20Screen%20Recording%20-%20iPhone%2015%20Pro%20-%202023-12-21%20at%2019.37.15.gif"/>


[1]: https://www.hackingwithswift.com/100/swiftui/99
[2]: 
[3]: 
[4]: 
