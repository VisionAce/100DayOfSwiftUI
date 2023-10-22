//
//  BookwormApp.swift
//  Bookworm
//
//  Created by 褚宣德 on 2023/10/18.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
