# Day 86: Projects 17: Flashzilla

Follow along at 
- [Day 86 – Project 17, part one][1]

# 📒 Field Notes

Focus on several topic:
- How to use gestures in SwiftUI
- Making vibrations with UINotificationFeedbackGenerator and Core Haptics
- Disabling user interactivity with allowsHitTesting()
 
 
## How to use gestures in SwiftUI

- onTapGesture()

- onLongPressGesture()

      .onLongPressGesture(minimumDuration: 1) {
        print("Long presswd!")
      } onPressingChanged: { inProgress in
        print("In progress: \(inProgress)")
      }
                
- scaleEffect()

- MagnificationGesture()
  - onChanged()
  - onEnded()
  
- RotateGesture()
  
      RotateGesture()
      .onChanged { angle in
      currentAmount = angle.rotation
      }
      .onEnded { _ in
      finalAmount += currentAmount
      currentAmount = .zero
      }

- **gestures clash**

>In this situation SwiftUI will always give the child’s gesture priority, which means when you tap the text view above you’ll see “Text tapped”.

    struct ContentView: View {
     var body: some View {
              VStack {
                  Text("Hello, World!")
                      .onTapGesture {
                          print("Text tapped")
                      }
              }
              .onTapGesture {
                  print("VStack tapped")
              }
          }
    }
      
  - highPriorityGesture()
  
  modifier to force the parent’s gesture to trigger instead
  
  - simultaneousGesture()
  
  modifier to tell SwiftUI you want both the parent and child gestures to trigger at the same time

  - [.sequenced(before: )][2]


## Making vibrations with UINotificationFeedbackGenerator and Core Haptics

- .sensoryFeedback()
- import CoreHaptics
- CHHapticEngine
his is the actual object that’s responsible for creating vibrations, so we need to create it up front before we want haptic effects.
- configure parameters 
  - CHHapticEventParameter()
    - .hapticIntensity()
    - .hapticSharpness()
  - CHHapticEvent()


## Disabling user interactivity with allowsHitTesting()

- [allowsHitTesting()][3]
- contentShape()
  - [state 1][4]
  - [state 2][5]

[1]: https://www.hackingwithswift.com/100/swiftui/86
[2]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/3a41b4d6e7d6ce1f42b1f64d42a93b6665997bdc/Day86/HowToUseGesturesInSwiftUI.swift#L32
[3]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/3a41b4d6e7d6ce1f42b1f64d42a93b6665997bdc/Day86/DisablingUserInteractivityWithAllowsHitTesting().swift#L10C1-L29C2
[4]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/3a41b4d6e7d6ce1f42b1f64d42a93b6665997bdc/Day86/DisablingUserInteractivityWithAllowsHitTesting().swift#L44
[5]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/3a41b4d6e7d6ce1f42b1f64d42a93b6665997bdc/Day86/DisablingUserInteractivityWithAllowsHitTesting().swift#L60
