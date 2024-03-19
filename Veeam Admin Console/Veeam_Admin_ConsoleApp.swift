//
//  Veeam_Admin_ConsoleApp.swift
//  Veeam Admin Console
//
//  Created by Marco Horstmann on 19.03.24.
//

import SwiftUI
import SwiftData

@main
struct Veeam_Admin_ConsoleApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
