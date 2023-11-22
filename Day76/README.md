# Day 76: Project 15: Accessibility

Follow along at 
- [Day 76 – Project 15, part three][1]

# 📒 Field Notes
Challenge


## Challenge 1

>The check out view in Cupcake Corner uses an image and loading spinner that don’t add anything to the UI, so find a way to make the screenreader not read them out.

[Use **.accessibilityHidden(true)**][2]


## Challenge 2

>Fix the list rows in iExpense so they read out the name and value in one single VoiceOver label, and their type in a hint.

Use
- **.accessibilityElement(children: .ignore)**
- **.accessibilityLabel()**
- **.accessibilityHint()**

[commit1][3]
[commit2][4]


## Challenge 3

>Do a full accessibility review of Moonshot – what changes do you need to make so that it’s fully accessible?

### ContentGridView、ContentListView
 
 - Read mission name in VoiceOver label and their date in a hint.
   - .accessibilityElement(children: .ignore)
   - .accessibilityLabel()
   - .accessibilityHint()

[commit1][5]
[commit2][6]

### MissionView

- Hidden mission.image
  - [Image(decorative: mission.image)][7]
- Hidden DividerView
  - .accessibilityHidden(true)
    [commit1][8]
    [c0mmit2][9]
- Add button trait for CrewMemberView
  - [.accessibilityAddTraits(.isButton)][10]
 
### CrewMemberView

- [Read Crew name and role in VoiceOver label][11]
  - .accessibilityElement(children: .ignore)
  - .accessibilityLabel("\(crewMember.astronaut.name) is \(crewMember.role)")
 
### AnstronautView

- [Hidden anstronaut image][12]
  - Image(decorative: astronaut.id)

[1]: https://www.hackingwithswift.com/100/swiftui/76
[2]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/2be4efe27274475bf4b4e5720dc7fe2dd4dd3d8c/Day76/Challenge1/CupcakeCorner_CheckoutView.swift#L29C64-L29C64
[3]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/2be4efe27274475bf4b4e5720dc7fe2dd4dd3d8c/Day76/Challenge2/ContentView.swift#L103C1-L105C51
[4]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/2be4efe27274475bf4b4e5720dc7fe2dd4dd3d8c/Day76/Challenge2/ContentView.swift#L153C1-L155C51
[5]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/2be4efe27274475bf4b4e5720dc7fe2dd4dd3d8c/Day76/Challenge3/View/ContentView.swift#L74C1-L76C92
[6]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/2be4efe27274475bf4b4e5720dc7fe2dd4dd3d8c/Day76/Challenge3/View/ContentView.swift#L128C1-L130C88
[7]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/2be4efe27274475bf4b4e5720dc7fe2dd4dd3d8c/Day76/Challenge3/View/MissionView.swift#L89
[8]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/2be4efe27274475bf4b4e5720dc7fe2dd4dd3d8c/Day76/Challenge3/View/MissionView.swift#L103C1-L104C55
[9]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/2be4efe27274475bf4b4e5720dc7fe2dd4dd3d8c/Day76/Challenge3/View/MissionView.swift#L112C1-L113C55
[10]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/2be4efe27274475bf4b4e5720dc7fe2dd4dd3d8c/Day76/Challenge3/View/MissionView.swift#L122C1-L123C59
[11]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/2be4efe27274475bf4b4e5720dc7fe2dd4dd3d8c/Day76/Challenge3/View/MissionView.swift#L52C1-L53C98
[12]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/2be4efe27274475bf4b4e5720dc7fe2dd4dd3d8c/Day76/Challenge3/View/AstronautView.swift#L15
