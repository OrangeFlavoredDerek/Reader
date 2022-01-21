//
//  ReaderApp.swift
//  Reader
//
//  Created by 陳峻琦 on 21/1/2022.
//

import SwiftUI

@main
struct ReaderApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
