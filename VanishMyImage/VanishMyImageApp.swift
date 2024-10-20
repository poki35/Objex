//
//  VanishMyImageApp.swift
//  VanishMyImage
//
//  Created by Kirill Ponomarenko on 20.10.24.
//

import SwiftUI

@main
struct VanishMyImageApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
