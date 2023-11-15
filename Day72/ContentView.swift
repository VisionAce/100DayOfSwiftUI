//
//  ContentView.swift
//  BucketList
//
//  Created by 褚宣德 on 2023/11/11.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        
        if viewModel.isUnlocked {
            ZStack {
                Map(position: $viewModel.camera, interactionModes: .all) {
                    ForEach(viewModel.locations) { location in
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
                                viewModel.selectedPlace = location
                            }
                        }
                    }
                }
                .ignoresSafeArea()
                .onMapCameraChange { mapCameraUpdateContext in
//                    print("\(mapCameraUpdateContext.camera.centerCoordinate)")
                    viewModel.latitude = mapCameraUpdateContext.camera.centerCoordinate.latitude
                    viewModel.longitude = mapCameraUpdateContext.camera.centerCoordinate.longitude
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
                            viewModel.addLocation()
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
            .sheet(item: $viewModel.selectedPlace) { place in
                EditView(location: place) { newLocation in
                    viewModel.update(location: newLocation)
                }
            }
        } else {
            Button("Unlock Places") {
                viewModel.authenticate()
            }
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(Capsule())
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


