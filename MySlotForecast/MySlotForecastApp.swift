//
//  MySlotForecastApp.swift
//  MySlotForecast
//
//  Created by Latte on 2023/01/26.
//

import SwiftUI

@main
struct MySlotForecastApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
