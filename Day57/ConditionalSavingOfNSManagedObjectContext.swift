//
//  ConditionalSavingOfNSManagedObjectContext.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/10/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        Button("Save") {
            if moc.hasChanges {
                try? moc.save()
            }
        }
    }
}

#Preview {
    ContentView()
}
