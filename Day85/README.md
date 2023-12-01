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

- [init()][2]
- [private func save()][3]



## Challenge 3

>Use a confirmation dialog to customize the way users are sorted in each tab – by name or by most recent.

- Prospect.swift
  - [func nameSort()][][4]
  - [func mostRecentSort()][5]
  
- ProspectsView.swift
  - [.toolbar][6]
  - [.confirmationDialog()][7]

[1]: https://www.hackingwithswift.com/100/swiftui/85
[2]: 
[3]:
[4]:
[5]:
[6]:
[7]:
