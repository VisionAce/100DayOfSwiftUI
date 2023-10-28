//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by 褚宣德 on 2023/10/23.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @Environment(\.scenePhase) var scenePhase
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            SingerFilterView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) {
            persistenceController.save()
        }
    }
}
