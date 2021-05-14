//
//  FavouriteEateriesCoreApp.swift
//  FavouriteEateriesCore
//
//  Created by Christopher Smith on 14/5/21.
//

import SwiftUI

@main
struct FavouriteEateriesCoreApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
