//
//  Expenses.swift
//  100DayOfSwiftUI
//
//  Created by 褚宣德 on 2023/9/21.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoder = try? encoder.encode(items) {
                UserDefaults.standard.set(encoder, forKey: "Items")
            }
        }
    }
    // the data might be saved, but it isn’t loaded again when the app relaunches. To solve that – and also to make our code compile again – we need to implement a custom initializer.
    init() {
        // Attempt to read the “Items” key from UserDefaults.
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            // Using JSONEncoder().encode() means “create an encoder and use it to encode something,” all in one step, rather than creating the encoder first then using it later.
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                // Ask the decoder to convert the data we received from UserDefaults into an array of ExpenseItem objects.
                items = decodedItems
                // If that worked, assign the resulting array to items and exit.
                return
            }
        }
        // Otherwise, set items to be an empty array.
        items = []
    }

}
