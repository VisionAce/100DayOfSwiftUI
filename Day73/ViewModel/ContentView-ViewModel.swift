//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by 褚宣德 on 2023/11/15.
//

import Foundation
import LocalAuthentication
import SwiftUI
import MapKit

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
//        @Published var mapPosition: MapCameraPosition = .region(.userRegion)
        @Published var camera: MapCameraPosition = .automatic
        @Published private(set) var locations: [Location]
        @Published var selectedPlace: Location?
        @Published var latitude = 0.0
        @Published var longitude = 0.0
        @Published var isUnlocked = false
        @Published var errorMessage = ""
        @Published var errorlocked = false
        
        
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlaces")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        func addLocation() {
            let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: latitude, longitude: longitude)
            locations.append(newLocation)
            save()
        }
        
        func update(location: Location) {
            guard let selectedPlace = selectedPlace else { return }
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                save()
            }
        }
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places."
                
                context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
                    if success {
                        Task { @MainActor in
//                            await MainActor.run {
//                                self.isUnlocked = true
//                            }
                            self.isUnlocked = true
                        }
                        
                    } else {
                        // error
                        Task { @MainActor in
                            self.errorlocked = true
                            self.errorMessage = "\(String(describing: error?.localizedDescription))\n\nPlease try again."
                        }
                    }
                }
            } else {
                // no biometrics
                Task { @MainActor in
                    self.errorlocked = true
                    self.errorMessage = "No biometrics\n\nPlease try again."
                }
            }
        }
    }
}
