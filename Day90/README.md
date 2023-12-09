# Day 90: Projects 17: Flashzilla

Follow along at 
- [Day 90 – Project 17, part five][1]

# 📒 Field Notes

Focus on several topic:
- Making iPhones vibrate with UINotificationFeedbackGenerator
- Fixing the bugs
- Adding and deleting cards
 
 
## Making iPhones vibrate with UINotificationFeedbackGenerator
使用觸覺回饋應當合理地判別使用情境。
例如：我們在答錯的情況才使用，不然當成功或失敗都有回饋時，雖然回饋呈現有差距，但還是讓人搞不清楚差別。
- [UINotificationFeedbackGenerator()][2]
- [.notificationOccurred(.error)][3]
- [.prepare()][4]


## Fixing the bugs
透過以下modifier限制卡片的相關操作，解決了89天遇到的問題。
- [.allowsHitTesting(index == cards.count - 1)][5]
- [.allowsHitTesting(timeRemaining > 0)][6]

方便盲人使用的設置：
- [.accessibilityHidden(index < cards.count - 1)][7]
- [.accessibilityAddTraits(.isButton)][8]
- @Environment(\.accessibilityVoiceOverEnabled)
- .accessibilityLabel()
- .accessibilityHint()

讓移除卡片的動畫更流暢：
- [.animation(.spring(), value: offset)][9]


## Adding and deleting cards

When we use the sheet() modifier we need to give SwiftUI a function it can run that returns the view to show in the sheet. For us above that’s a closure with EditCards() inside – that creates and returns a new view, which is what the sheet wants.

When we write EditCards(), we’re relying on syntactic sugar – we’re treating our view struct like a function, because Swift silently treats that as a call to the view’s initializer. So, in practice we’re actually writing EditCards.init(), just in a shorter way.

This all matters because rather than creating a closure that calls the EditCards initializer, we can actually pass the EditCards initializer directly to the sheet, like this:

            .sheet(isPresented: $showingEditScreen, onDismiss: resetCards, content: EditCards.init)

>Important: This approach only works because EditCards has an initializer that accepts no parameters. If you need to pass in specific values you need to use the closure-based approach instead.



[1]: https://www.hackingwithswift.com/100/swiftui/90
[2]: 
[3]: 
[4]: 
[5]: 
[6]: 
[7]: 
[8]: 
[9]:
