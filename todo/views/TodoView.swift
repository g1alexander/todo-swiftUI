//
//  TodoView.swift
//  todo
//
//  Created by g1alexander on 11/13/23.
//

import SwiftUI

struct TodoView: View {
    @Binding var todos: [Todo]
    
    var body: some View {
        TabView {
            HomeView(todos: $todos).tabItem {
                Text("Todos")
                Image(systemName: "list.bullet")
            }
            
            CompleteTaskView(todos: $todos).tabItem {
                Text("Complete")
                Image(systemName: "checkmark.circle.fill")
            }
        }
    }
}

#Preview {
    TodoView(todos: .constant(Todo.sampleData))
}
