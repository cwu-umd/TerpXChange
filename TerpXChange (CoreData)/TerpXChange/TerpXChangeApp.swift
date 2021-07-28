//
//  TerpXChangeApp.swift
//  TerpXChange
//
//  Created by Hank Wu on 7/24/21.
//

import SwiftUI

@main
struct TerpXChangeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
