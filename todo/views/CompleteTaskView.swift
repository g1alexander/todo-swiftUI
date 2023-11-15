//
//  CompleteTaskView.swift
//  todo
//
//  Created by g1alexander on 11/13/23.
//

import SwiftUI

struct CompleteTaskView: View {
    @Binding var todos: [Todo]
    
    var body: some View {
        NavigationStack {
            VStack {
                ListView(todos: $todos)
            }
            .navigationTitle("Todos list")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CompleteTaskView(todos: .constant(Todo.sampleData))
}
