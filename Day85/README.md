# Day 85: Projects 16: HotProspects

Follow along at 
- [Day 85 – Project 16, part seven][1]

# 📒 Field Notes

Challenge
 
 
## Challenge 1

>Add an icon to the “Everyone” screen showing whether a prospect was contacted or not.

                        Image(systemName: prospect.isContacted ? "person.crop.circle.fill.badge.checkmark" : "person.crop.circle.badge.xmark")
                            .foregroundStyle(prospect.isContacted ? .green : .blue)



## Challenge 2

>Use JSON and the documents directory for saving and loading our user data.

- [add FileManager-DocumentsDirectory.swift][2]
- [init()][3]
- [private func save()][4]



## Challenge 3

>Use a confirmation dialog to customize the way users are sorted in each tab – by name or by most recent.

- Prospect.swift
  - [add **date** parameter to **class Prospect**][5]
  - [func nameSort()][6]
  - [func mostRecentSort()][7]
  
- ProspectsView.swift
  - [.toolbar][8]
  - [.confirmationDialog()][9]

[1]: https://www.hackingwithswift.com/100/swiftui/85
[2]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/main/Day85/FileManager-DocumentsDirectory.swift
[3]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/6806935f18c0032770efa5dbcc32eeb6d7415aa3/Day85/Model/Prospect.swift#L25C1-L43C6
[4]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/6806935f18c0032770efa5dbcc32eeb6d7415aa3/Day85/Model/Prospect.swift#L45C1-L56C6
[5]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/6806935f18c0032770efa5dbcc32eeb6d7415aa3/Day85/Model/Prospect.swift#L15
[6]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/6806935f18c0032770efa5dbcc32eeb6d7415aa3/Day85/Model/Prospect.swift#L89C1-L95C6
[7]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/6806935f18c0032770efa5dbcc32eeb6d7415aa3/Day85/Model/Prospect.swift#L97C1-L102C6
[8]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/6806935f18c0032770efa5dbcc32eeb6d7415aa3/Day85/View/ProspectsView.swift#L86C1-L90C18
[9]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/6806935f18c0032770efa5dbcc32eeb6d7415aa3/Day85/View/ProspectsView.swift#L96C1-L104C14
