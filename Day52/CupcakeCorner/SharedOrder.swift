//
//  SharedOrder.swift
//  CupcakeCorner
//
//  Created by 褚宣德 on 2023/10/17.
//

import SwiftUI

@dynamicMemberLookup // This attribute allows us to dynamically handle access properties that don't directly exist. Yes, it's a bit confusing.

class SharedOrder: ObservableObject, Codable{
        enum CodingKeys: CodingKey {
            case items
        }
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var items = OrderItem()
    
    
    subscript<T>(dynamicMember keyPath: KeyPath<OrderItem, T>) -> T { // This adds a custom subscript using a dynamic member keyPath.
        items[keyPath: keyPath]
     }
     
    subscript<T>(dynamicMember keyPath: WritableKeyPath<OrderItem, T>) -> T {
         get {
             items[keyPath: keyPath]
         }
         
         set {
             items[keyPath: keyPath] = newValue
         }
     }
    
    init() { }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(items.self, forKey: .items)
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode(OrderItem.self, forKey: .items)
    }
}

