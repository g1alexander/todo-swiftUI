//
//  HomeView.swift
//  todo
//
//  Created by g1alexander on 11/13/23.
//

import SwiftUI

struct HomeView: View {
    @Binding var todos: [Todo]
    @State private var showDetails  = false
    @State private var isEdit = false
    @State private var todo: Todo = Todo(id: 0, name: "", description: "")
    
    var body: some View {
        NavigationStack {
            VStack {
                ListView(todos: $todos)
            }
            .navigationTitle("Todos list")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {showDetails = true}, label: {
                        Text("+")
                    })
                })
            })
            .sheet(isPresented: $showDetails){
                FormView(showDetails: $showDetails, todos: $todos, todo: $todo, isEdit: $isEdit)
            }
        }
    }
}

#Preview {
    HomeView(todos: .constant(Todo.sampleData))
}
