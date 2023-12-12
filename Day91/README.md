# Day 91: Projects 17: Flashzilla

Follow along at 
- [Day 91 – Project 17, part six][1]

# 📒 Field Notes

Challenge Day
 
 
## Challenge 1

>When adding a card, the textfields keep their current text – fix that so that the textfields clear themselves after a card is added.

- [在func addCard() 加入：][2]

        newPrompt = ""
        newAnswer = ""


## Challenge 2

>If you drag a card to the right but not far enough to remove it, then release, you see it turn red as it slides back to the center. Why does this happen and how can you fix it? (Tip: think about the way we set **offset** back to 0 immediately, even though the card hasn’t animated yet. You might solve this with a ternary within a ternary, but a custom modifier will be cleaner.)

- [方法一：][3]

      .fill(offset.width == 0 ? .white : offset.width > 0 ? .green : .red)

- [方法二：][4]

    var cardColor: Color {
        if offset.width > 0 {
            return .green
        } else if offset.width < 0 {
            return .red
        } else {
            return .white
        }
    }

## Challenge 3
>For a harder challenge: when the users gets an answer wrong, add that card goes back into the array so the user can try it again. Doing this successfully means rethinking the **ForEach** loop, because relying on simple integers isn’t enough – your cards need to be uniquely identifiable.

- Card.swift
  在 **struct Card**中加入
   - Identifiable, Hashable
   - var id = UUID()

- CardView.swift
  - [加入參數retry][5]
  - [在.onEnded中的答錯條件下加入：][6]
    - retry?()
    
      讓我們可以在ContentView中使用方法**returnCard(at index: Int)**
    - offset = .zero
    
      讓卡片移動後回到位置CGSize.zero

- ContentView.swift
  - [加入方法returnCard][7]
        
        func returnCard(at index: Int) {
            guard index >= 0 else { return }
            let card = cards.remove(at: index)
            cards.insert(card, at: 0)
        }

  - [ZStack][8]
  
                      ForEach(Array(cards.enumerated()), id: \.element) { (index, card) in
                        VStack {
                            CardView(card: cards[index]) {
                                withAnimation {
                                    removeCard(at: index)
                                }
                            } retry: {
                                withAnimation {
                                    returnCard(at: index)
                                }
                            }
                            .stacked(at: index, in: cards.count)
                            .allowsHitTesting(index == cards.count - 1)
                            .accessibilityHidden(index < cards.count - 1)
                        }
                    }


## Challenge 4

1. Make it use documents JSON rather than **UserDefaults** – this is generally a good idea, so you should get practice with this.
2. Try to find a way to centralize the loading and saving code for the cards. You might need to experiment a little to find something you like!


- 創建以下檔案：
  - [FileManager-DocumentsDirectory.swift][9]
  - [CardManager.swift][10]
    
    藉由CardManager來管理卡片的存取、重置。
 
- ContentView.swift  
  - [參數cards初始化為CardManager.load()][11]
  - [方法resetCards][12]
  
    loadData()的方式改為cards = CardManager.load()

## 📸 Screenshots

- 編輯卡片與答題過程
  
<img width="600" height="300" src="https://github.com/VisionAce/Screenshoots/blob/main/Simulator%20Screen%20Recording%20-%20iPhone%2015%20Pro%20-%202023-12-12%20at%2014.44.26.gif"/>

- 無障礙模式

  <img width="600" height="300" src="https://github.com/VisionAce/Screenshoots/blob/main/Simulator%20Screen%20Recording%20-%20iPhone%2015%20Pro%20-%202023-12-12%20at%2014.56.21.gif"/>
  


[1]: https://www.hackingwithswift.com/100/swiftui/91
[2]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/038a1ee7f3ffd63721eec6b23ed3e1acb69defce/Day91/View/EditCards.swift#L92C1-L93C23
[3]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/038a1ee7f3ffd63721eec6b23ed3e1acb69defce/Day91/View/CardView.swift#L34
[4]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/038a1ee7f3ffd63721eec6b23ed3e1acb69defce/Day91/View/CardView.swift#L35
[5]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/038a1ee7f3ffd63721eec6b23ed3e1acb69defce/Day91/View/CardView.swift#L13
[6]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/038a1ee7f3ffd63721eec6b23ed3e1acb69defce/Day91/View/CardView.swift#L78C1-L79C43
[7]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/038a1ee7f3ffd63721eec6b23ed3e1acb69defce/Day91/View/ContentView.swift#L175C1-L179C6
[8]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/038a1ee7f3ffd63721eec6b23ed3e1acb69defce/Day91/View/ContentView.swift#L51C1-L68C18
[9]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/main/Day91/FileManager/FileManager-DocumentsDirectory.swift
[10]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/main/Day91/FileManager/CardManager.swift
[11]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/038a1ee7f3ffd63721eec6b23ed3e1acb69defce/Day91/View/ContentView.swift#L20
[12]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/038a1ee7f3ffd63721eec6b23ed3e1acb69defce/Day91/View/ContentView.swift#L186
