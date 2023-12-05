# Day 89: Projects 17: Flashzilla

Follow along at 
- [Day 89 – Project 17, part four][1]

# 📒 Field Notes

Focus on several topic:
- Coloring views as we swipe
- Counting down with a Timer
- Ending the app with allowsHitTesting()
 
 
## Coloring views as we swipe

- [.opacity(1 - Double(abs(offset.width / 50))][2]
>As for the white fill opacity, this is going to be similar to the opacity() modifier we added previously except we’ll use 1 minus 1/50th of the gesture width rather than 2 minus the gesture width. This creates a really nice effect: we used 2 minus earlier because it meant the card would have to move at least 50 points before fading away, but for the card fill we’re going to use 1 minus so that it starts becoming colored straight away.


## Counting down with a Timer

- [onReceive()][3]
- [onChange()][4]


## Ending the app with allowsHitTesting()

- [allowsHitTesting()][5]
- [**isActive** stays false or true][6]


## Problem

>When cards are not removed in order, even if the number of cards is **Empty**, the timer does not operate as we intend.


<img width="300" height="600" src="https://github.com/VisionAce/Screenshoots/blob/main/Simulator%20Screen%20Recording%20-%20iPhone%2015%20Pro%20-%202023-12-05%20at%2014.23.50.gif" style="transform:rotate(90deg)/>


[1]: https://www.hackingwithswift.com/100/swiftui/89
[2]:
[3]:
[4]:
[5]:
[6]:
