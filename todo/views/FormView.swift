//
//  FormView.swift
//  todo
//
//  Created by g1alexander on 11/13/23.
//

import SwiftUI

struct FormView: View {
    @Binding var showDetails: Bool
    @Binding var todos: [Todo]
    @Binding var todo: Todo
    @Binding var isEdit: Bool
    
    var body: some View {
        VStack {
            TextField(
                "Name task",
                text: $todo.name
            )
            .padding()
            .background(.gray.opacity(0.2))
            .cornerRadius(5.0)
            
            TextField("Comment", text: $todo.description, prompt: Text("description"), axis: .vertical)
                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(5.0)
                .padding(.vertical)
            
            
            Button(action: {
                if isEdit {
                    Task {
                        await fetchDataEdit()
                    }
                } else {
                    print("add")
                    Task {
                        await fetchDataAdd()
                    }
                }
                
            }, label: {
                Text("Save")
                    .padding(.horizontal)
                    .padding(.vertical, 7)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 7.0, style: .continuous))
                
            })
        }
        .padding()
    }
    
    func fetchDataAdd() async {
        if let response = await TodoAPI.POST(data: DataSendApi(data: Data(name: todo.name, complete: false, description: todo.description))) {
            
            todos.append(response)
            showDetails = false
        }
    }
    
    func fetchDataEdit() async {
        if let response = await TodoAPI.PUT(data: DataSendApi(data: Data(name: todo.name, complete: false, description: todo.description)), id: todo.id){
            print(response)
            
            let mapData = todos.map { existingTodo in
                var updatedTodo = existingTodo // Creamos una copia mutable
                
                if existingTodo.id == response.id {
                    updatedTodo.name = response.name
                    updatedTodo.description = response.description
                }
                
                return updatedTodo
            }
            
            todos = mapData
            
            showDetails = false
        }
    }
}

#Preview {
    FormView(showDetails: .constant(false), todos: .constant(Todo.sampleData), todo: .constant(Todo.sampleData[0]), isEdit: .constant(false))
}
