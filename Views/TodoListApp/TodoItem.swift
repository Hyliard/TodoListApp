//
//  TodoItem.swift
//  TodoListApp
//
//  Created by Hyliard on 18/11/2024.
//

import Foundation

struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}
