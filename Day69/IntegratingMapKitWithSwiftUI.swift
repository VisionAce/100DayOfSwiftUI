//
//  IntegratingMapKitWithSwiftUI.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/11/12.
//

import MapKit
import SwiftUI

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    @State private var mapPosition = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)))
    
    let locations = [
        Location(name: "Buckingham Pplace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    var body: some View {
        NavigationStack {
            Map(position: $mapPosition) {
                ForEach(locations) { location in
                    // Marker(location.name, coordinate: location.coordinate)
                    Annotation(location.name, coordinate: location.coordinate) {
                        NavigationLink {
                            Text(location.name)
                        } label: {
                            ZStack {
                                Circle()
                                    .stroke(.red, lineWidth: 3)
                                    .frame(width: 44, height: 44)
                                // .onTapGesture {
                                // print("Tapped on \(location.name)")
                                // }
                                Text("🗼")
                            }
                        }
                    }
                }
            }
            .navigationTitle("London Explorer")
        }
    }
}

#Preview {
    ContentView()
}
