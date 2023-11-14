//
//  ContentView.swift
//  BucketList
//
//  Created by 褚宣德 on 2023/11/11.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @State private var mapPosition: MapCameraPosition = .region(.userRegion)
    @State private var locations = [Location]()
    @State private var selectedPlace: Location?
    
    @State private var camera: MapCameraPosition = .automatic
    @State private var latitude = 0.0
    @State private var longitude = 0.0
    
    
    
    var body: some View {
        ZStack {
            Map(position: $camera, interactionModes: .all) {
                 ForEach(locations) { location in
                    Annotation(location.name, coordinate: location.coordinate) {
                        VStack {
                            Image(systemName: "star.circle")
                                .resizable()
                                .foregroundStyle(.red)
                                .frame(width: 44, height: 44)
                                .background(.white)
                                .clipShape(Circle())
                            
                            Text(location.name)
                                .fixedSize()
                        }
                        .onTapGesture {
                            selectedPlace = location
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .onMapCameraChange { mapCameraUpdateContext in
                print("\(mapCameraUpdateContext.camera.centerCoordinate)")
                latitude = mapCameraUpdateContext.camera.centerCoordinate.latitude
                longitude = mapCameraUpdateContext.camera.centerCoordinate.longitude
            }
            Circle()
                .fill(.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: latitude, longitude: longitude)
                        locations.append(newLocation)
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(.black.opacity(0.75))
                    .foregroundStyle(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        }
        .sheet(item: $selectedPlace) { place in
            EditView(location: place) { newLocation in
                if let index = locations.firstIndex(of: place) {
                    locations[index] = newLocation
                }
                
            }
        }
    }
}


extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        return .init(latitude: 50, longitude: 0)
    }
    
    static let home = CLLocationCoordinate2D(latitude: 23.5, longitude: 121.5)
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return.init(
            center: .userLocation,
            span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25)
        )
    }
}

#Preview {
    ContentView()
}


