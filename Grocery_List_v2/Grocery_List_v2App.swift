//
//  Grocery_List_v2App.swift
//  Grocery_List_v2
//
//

import SwiftUI

@main
struct Grocery_List_v2App: App {
    
    @StateObject private var modelData = ModelData()

    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
