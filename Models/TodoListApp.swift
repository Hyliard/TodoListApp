//
//  TodoListApp.swift
//  TodoListApp
//
//  Created by Hyliard on 18/11/2024.
//

import SwiftUI
import SwiftData

@main
struct TodoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: TodoItem.self)
    }
}
