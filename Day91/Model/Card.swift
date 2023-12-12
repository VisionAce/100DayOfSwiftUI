//
//  Card.swift
//  Flashzilla
//
//  Created by 褚宣德 on 2023/12/4.
//

import Foundation

struct Card: Codable, Identifiable, Hashable {
    let prompt: String
    let answer: String
    var id = UUID()
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
