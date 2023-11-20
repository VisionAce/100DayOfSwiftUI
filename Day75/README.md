# Day 75: Project 15: Accessibility

Follow along at 
- [Day 75 –  Project 15, part 2][1]

# 📒 Field Notes
As you work through today’s three topics, I hope you’re pleasantly surprised by a) how easy this stuff really is, and b) how little it affects the rest of your code. And once you realize that, you’ll start to wonder why so many other app developers do such a poor job of making their apps accessible to everyone.

- Fixing Guess the Flag
- Fixing Word Scramble
- Fixing Bookworm


## Fixing Guess the Flag

- [Use that name as the key for **labels**.][2]
- [Commit2][3]


## Fixing Word Scramble

- Approach 1

      List(usedWords, id: \.self) { word in
       HStack {
           Image(systemName: "\(word.count).circle")
           Text(word)
       }
       .accessibilityElement(children: .ignore)
       .accessibilityLabel("\(word), \(word.count) letters")
      }

- [Approach 2][4]

      HStack {
       Image(systemName: "\(word.count).circle")
       Text(word)
      }
      .accessibilityElement(children: .ignore)
      .accessibilityLabel(word)
      .accessibilityHint("\(word.count) letters") 

## Fixing Bookworm

- [Approach 1][5]

      image(for: number)
      .onTapGesture {
       rating = number
      }
      .accessibilityLabel("\(number == 1 ? "1 star" : "\(number) stars")")
      .accessibilityRemoveTraits(.isImage)
      .accessibilityAddTraits(number > rating ? .isButton : [.isButton, .isSelected])


- [Approach 2][6]

      HStack {
      }
      .accessibilityElement()
      .accessibilityLabel("Rating")
      .accessibilityValue(rating == 1 ? "1 star" : "\(rating) stars")
      .accessibilityAdjustableAction { direction in
       switch direction {
       case .increment:
           if rating < maximumRating { rating += 1 }
       case .decrement:
           if rating > 1 { rating -= 1 }
       default:
           break
       }
      }


[1]: https://www.hackingwithswift.com/100/swiftui/75
[2]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/4d3301fb81eae46388fe91e97b0160ec682bb90e/Day75/FixingGuessTheFlag/ContentView.swift#L57C1-L69C6
[3]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/4d3301fb81eae46388fe91e97b0160ec682bb90e/Day75/FixingGuessTheFlag/ContentView.swift#L114C1-L114C104
[4]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/4d3301fb81eae46388fe91e97b0160ec682bb90e/Day75/FixingWordScramble/ContentView.swift#L48C1-L51C76
[5]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/4d3301fb81eae46388fe91e97b0160ec682bb90e/Day75/FixingBookworm/RatingView.swift#L34C1-L37C102
[6]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/4d3301fb81eae46388fe91e97b0160ec682bb90e/Day75/FixingBookworm/RatingView.swift#L40C1-L53C10
