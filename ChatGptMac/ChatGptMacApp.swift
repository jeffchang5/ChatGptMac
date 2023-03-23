//
//  ChatGptMacApp.swift
//  ChatGptMac
//
//  Created by Jeffrey Chang on 3/23/23.
//

import SwiftUI

@main
struct ChatGptMacApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
