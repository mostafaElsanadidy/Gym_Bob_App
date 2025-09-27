//
//  Gym_Bob_AppApp.swift
//  Gym_Bob_App
//
//  Created by mostafa elsanadidy on 27.09.25.
//

import SwiftUI

@main
struct Gym_Bob_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
