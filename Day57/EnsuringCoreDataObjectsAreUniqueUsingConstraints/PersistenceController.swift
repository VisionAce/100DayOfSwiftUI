//
//  PersistenceController.swift
//  CoreDataProject
//
//  Created by 褚宣德 on 2023/10/23.
//

import CoreData

struct PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()

    // Storage for Core Data
    let container: NSPersistentContainer

    // A test configuration for SwiftUI previews
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        
        // Create 10 example programming languages.
        for _ in 0..<10 {
            let wizard = Wizard(context: controller.container.viewContext)
            wizard.name = "Example wizard 1"
        }

        return controller
    }()

    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    init(inMemory: Bool = false) {

        container = NSPersistentContainer(name: "CoreDataProject")
        
        if inMemory {
                 container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
             }

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
        self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }
    
    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Show some error here
            }
        }
    }
    
}
