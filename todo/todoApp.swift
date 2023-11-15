//
//  todoApp.swift
//  todo
//
//  Created by g1alexander on 11/13/23.
//

import SwiftUI

@main
struct todoApp: App {
    @State private var todos = Todo.sampleData
    
    var body: some Scene {
        WindowGroup {
            TodoView(todos: $todos)
        }
    }
}
