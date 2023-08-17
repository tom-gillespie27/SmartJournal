//
//  SmartJournalApp.swift
//  SmartJournal
//
//  Created by Thomas Gillespie on 8/17/23.
//

import SwiftUI

@main
struct SmartJournalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
