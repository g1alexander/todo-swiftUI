//
//  FormView.swift
//  todo
//
//  Created by g1alexander on 11/13/23.
//

import SwiftUI

struct FormView: View {
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        VStack {
            TextField(
                "Name task",
                text: $title
            )
            .padding()
            .background(.gray.opacity(0.2))
            .cornerRadius(5.0)
            
            TextField("Comment", text: $description, prompt: Text("description"), axis: .vertical)
                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(5.0)
                .padding(.vertical)
            
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
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
    FormView()
}
