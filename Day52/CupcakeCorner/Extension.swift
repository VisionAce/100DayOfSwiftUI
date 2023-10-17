//
//  Extension.swift
//  CupcakeCorner
//
//  Created by 褚宣德 on 2023/10/17.
//

import Foundation

extension String {
    var isHaveSpace: Bool {
        for character in self {
            if character.isWhitespace {
                return true
            }
        }
        return false
    }
}


