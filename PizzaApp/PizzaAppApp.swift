//
//  PizzaAppApp.swift
//  PizzaApp
//
//  Created by Chamika Perera on 2022-05-14.
//

import SwiftUI

@main
struct PizzaAppApp: App {
    let persistenceController = PersistenceController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
