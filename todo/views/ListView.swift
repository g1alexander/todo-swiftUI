//
//  ListView.swift
//  todo
//
//  Created by g1alexander on 11/13/23.
//

import SwiftUI

struct ListView: View {
    @Binding var todos: [Todo]
    @State private var todoEdit: Todo = Todo(id: 0, name: "", description: "")
    @State private var showDetails  = false
    @State private var isEdit = true
    
    var body: some View {
        List {
            ForEach($todos) { $todo in
                Text(todo.name)
                    .swipeActions(edge: .leading) {
                        Button(action: {
                            if let index = todos.firstIndex(where: {$0.id == todo.id}){
                                
                                Task {
                                    await fetchDataDelete(id: todo.id)
                                    todos.remove(at: index)
                                }
                            }
                        }, label: {
                            Label("Delete", systemImage: "trash.fill")
                        })
                        .tint(.red)
                    }
                    .swipeActions(edge: .trailing) {
                        Button(action: {
                            let todo = todos.filter { $0.id == todo.id }
                            todoEdit = todo[0]
                            
                            showDetails = true
                        }, label: {
                            Label("Edit", systemImage: "pencil")
                        })
                        .tint(.blue)
                    }
                    .swipeActions(edge: .trailing) {
                        Button(action: {
                            if let index = todos.firstIndex(where: {$0.id == todo.id}){
                                Task {
                                    await fetchDataEdit(todo: todo)
                                    todos.remove(at: index)
                                }
                            }
                        }, label: {
                            Label("complete", systemImage: "checkmark.circle.fill")
                        })
                        .tint(.green)
                    }
                    .sheet(isPresented: $showDetails){
                        FormView(todo: $todoEdit, isEdit: $isEdit)
                    }
            }
        }
    }
    
    func fetchDataDelete(id: Int) async {
        await TodoAPI.DELETE(id: id)
    }
    func fetchDataEdit(todo:Todo) async {
        await TodoAPI.PUT(data: DataSendApi(data: Data(name: todo.name, complete: true, description: todo.description)), id: todo.id)
    }
}

#Preview {
    ListView(todos: .constant(Todo.sampleData))
}
