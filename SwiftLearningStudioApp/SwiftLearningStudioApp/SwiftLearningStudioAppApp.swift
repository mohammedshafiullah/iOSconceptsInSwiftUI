//
//  SwiftLearningStudioAppApp.swift
//  SwiftLearningStudioApp
//
//  Created by mohammed Shafiullah on 22/10/25.
//

import SwiftUI
import CoreData

@main
struct SwiftLearningStudioAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
