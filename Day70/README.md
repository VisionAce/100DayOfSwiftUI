# Day 70: Project 14: BucketList

Follow along at 
- [Day 70 – Project 14, part three][1]

# 📒 Field Notes
This day covers Part Three of Project 14 in the 100 Days of SwiftUI Challenge.

It focuses on several specific topics:

- Adding user locations to a map
- Improving our map annotations
- Selecting and editing map annotations



## Adding user locations to a map

> Problem: I can't create a new Location (iOS 17)

### SOLVED

- via [SOLVED: centre coordinates from visible map?][2]

- [KeyPoint][3]

      import MapKit
      import SwiftUI
      
      struct ContentView: View {
      
          @State private var cameraPosition: MapCameraPosition = .region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40, longitude: 40), span: MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25)))
      
          var body: some View {
              Map(position: $cameraPosition)
                  .onMapCameraChange { mapCameraUpdateContext in
                      print("\(mapCameraUpdateContext.camera.centerCoordinate)")
                  }
          }
      }

- [Add two Parameter][4]

    @State private var latitude = 0.0
    @State private var longitude = 0.0

- [Button][5]

     Button {
         let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: latitude, longitude: longitude)
         locations.append(newLocation)
     }

## 📸 Screenshots
[embed](https://www.youtube.com/shorts/IIMoryHEow0)


[1]: https://www.hackingwithswift.com/100/swiftui/70
[2]: https://www.hackingwithswift.com/forums/swiftui/centre-coordinates-from-visible-map/23052
[3]:
[4]:
[5]:
