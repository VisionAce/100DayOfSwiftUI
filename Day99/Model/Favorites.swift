//
//  Favorites.swift
//  SnowSeeker
//
//  Created by 褚宣德 on 2023/12/20.
//

import Foundation

class Favorites: ObservableObject {
    private var resorts: Set<String>
    private var saveKey = "Favorites"
    let defaults = UserDefaults.standard
    
    init() {
        // load our saved data
        
        if let favorites = defaults.array(forKey: saveKey) as? [String] {
            print("INIT",favorites)
            resorts = Set(favorites)
        } else {
            print("Empty resort")
            resorts = []
        }
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        objectWillChange.send()
        print("ID", resort.id)
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        // write out our data
        print("Save:", resorts)
        defaults.set(Array(resorts), forKey: saveKey)
    }
}
