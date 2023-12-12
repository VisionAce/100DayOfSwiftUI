//
//  CardManager.swift
//  Flashzilla
//
//  Created by 褚宣德 on 2023/12/11.
//

import Foundation

struct CardManager {
    static let savePath = FileManager.documentsDirectory.appendingPathComponent("FlashzillaCard")
    
    static func load() -> [Card] {
        do {
            let data = try Data(contentsOf: savePath)
            return try JSONDecoder().decode([Card].self, from: data)
        } catch {
            print("Unable to load data.")
        }
        return []
    }
    
    static func save(cards: [Card]) {
        do {
            let encoded = try JSONEncoder().encode(cards)
            try encoded.write(to: savePath, options: [.atomic, .completeFileProtection])
            
        } catch {
            print("Unable to save cards to savePath.")
        }
    }
    
    static func reset() {
       let resetCard = [Card]()
        save(cards: resetCard)
    }
    
}
