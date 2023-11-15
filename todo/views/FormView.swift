//
//  FormView.swift
//  todo
//
//  Created by g1alexander on 11/13/23.
//

import SwiftUI

struct FormView: View {
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
                    
                } else {
                    
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
}

#Preview {
    FormView(todo: .constant(Todo.sampleData[0]), isEdit: .constant(true))
}
