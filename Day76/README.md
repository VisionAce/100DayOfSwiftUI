# Day 76: Project 15: Accessibility

Follow along at 
- [Day 76 – Project 15, part three][1]

# 📒 Field Notes
Challenge


## Challenge 1

>The check out view in Cupcake Corner uses an image and loading spinner that don’t add anything to the UI, so find a way to make the screenreader not read them out.

Use **.accessibilityHidden(true)**


[commit][2]

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
