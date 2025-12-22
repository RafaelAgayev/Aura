//
//  AuraApp.swift
//  Aura
//
//  Created by Rafael Agayev on 22.12.25.
//

import SwiftUI
import CoreData

@main
struct AuraApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
