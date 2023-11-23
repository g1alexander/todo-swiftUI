//
//  TodoView.swift
//  todo
//
//  Created by g1alexander on 11/13/23.
//

import SwiftUI

struct TodoView: View {    
    @State private var todos = Todo.sampleData
    
    var body: some View {
        TabView {
            HomeView(todos: $todos).tabItem {
                Text("Todos")
                Image(systemName: "list.bullet")
            }
            .task {
                await fetchDataAll(isComplete: false)
            }
            
            CompleteTaskView(todos: $todos).tabItem {
                Text("Complete")
                Image(systemName: "checkmark.circle.fill")
            }
            .task {
                await fetchDataAll(isComplete: true)
            }
        }
    }
    
    func fetchDataAll(isComplete: Bool) async {
        if let response = await TodoAPI.GETALL(isComplete: isComplete) {
            todos = response
        }
    }
}

#Preview {
    TodoView()
}
