//
//  OrderItem.swift
//  CupcakeCorner
//
//  Created by 褚宣德 on 2023/10/17.
//

import Foundation

struct OrderItem: Codable {
    
    var type = 0
    var quantity = 3
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasVaildAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        } else if name.isHaveSpace || streetAddress.isHaveSpace || city.isHaveSpace || zip.isHaveSpace {
            return false
        }
        return true
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2
        
        // complicated cakes cost more
        cost += (Double(type) / 2)
        
        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // 0.50/cake for sprinkles
        if addSprinkles {
            cost  += Double(quantity) / 2
        }
        return cost
    }
}
