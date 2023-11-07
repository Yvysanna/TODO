//
//  TODOApp.swift
//  TODO
//
//  Created by Yvette Schröder on 22/09/2023.
//

import SwiftUI
import SwiftData

/*
 MVVM
 M -> Model = Data point
 V -> View = UI componsents
 VM -> ViewModel = Observable object or class managing models for view
 */

@main
struct TODOApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
