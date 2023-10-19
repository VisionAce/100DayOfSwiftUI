//
//  BookwormApp.swift
//  100DaysOfSwiftUI
//
//  Created by 褚宣德 on 2023/10/19.
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
