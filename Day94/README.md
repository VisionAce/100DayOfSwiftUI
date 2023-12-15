# Day 94: Projects 18: LayoutAndGeometry

Follow along at 
- [Day 94 – Project 18, part three][1]

# 📒 Field Notes

Challenge

First, put your ContentView back to the spinning color rows example we had:

      struct ContentView: View {
          let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
      
          var body: some View {
              GeometryReader { fullView in
                  ScrollView(.vertical) {
                      ForEach(0..<50) { index in
                          GeometryReader { geo in
                              Text("Row #\(index)")
                                  .font(.title)
                                  .frame(maxWidth: .infinity)
                                  .background(colors[index % 7])
                                  .rotation3DEffect(.degrees(geo.frame(in: .global).minY -       fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                          }
                          .frame(height: 40)
                      }
                  }
              }
          }
      }
 
 
## Challenge 1

>Make views near the top of the scroll view fade out to 0 opacity – I would suggest starting at about 200 points from the top.

- 做一個將值轉化至所需範圍的方法**mapValue**

        func mapValue(_ value: Double, from minValue: Double, to maxValue: Double,standard_min: Double = 0.0,standard_max: Double = 1.0) -> Double {
            let normalizedValue = (value - minValue) / (maxValue - minValue)
            let result = (standard_max - standard_min) * normalizedValue + standard_min
            return max(standard_min, min(standard_max, result))
        }
        
- .opacity()

      .opacity(
          mapValue(geo.frame(in: .global).midY,
                      from: 0,
                      to:  fullView.size.height,
                      standard_min: 0.2))


## Challenge 2

>Make views adjust their scale depending on their vertical position, with views near the bottom being large and views near the top being small. I would suggest going no smaller than 50% of the regular size.

- .scaleEffect()

      .scaleEffect(
          mapValue(geo.frame(in: .global).midY,
                      from: 0,
                      to: fullView.size.height,
                      standard_min: 0.5,
                      standard_max: 1.4)
      )


## Challenge 3

>For a real challenge make the views change color as you scroll. For the best effect, you should create colors using the Color(hue:saturation:brightness:) initializer, feeding in varying values for the hue.

- .background()

      .background(
          Color(
              hue: mapValue(geo.frame(in: .global).maxY,
                              from: 0,
                              to:  fullView.size.height),
              saturation: 0.8,
              brightness: 1)
      )


## 📸 Screenshots

<img width="300" height="600" src="https://github.com/VisionAce/Screenshoots/blob/main/Simulator%20Screen%20Recording%20-%20iPhone%2015%20Pro%20-%202023-12-15%20at%2020.33.26.gif"/>



[1]: https://www.hackingwithswift.com/100/swiftui/94
