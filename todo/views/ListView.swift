//
//  ListView.swift
//  todo
//
//  Created by g1alexander on 11/13/23.
//

import SwiftUI

struct ListView: View {
    @State private var tasks = ["Tarea 1", "Tarea 2", "Tarea 3"]
    @State private var showDetails  = false
    
    var body: some View {
        List {
            ForEach(tasks, id: \.self) { task in
                Text(task)
                    .swipeActions(edge: .leading) {
                        Button(action: {}, label: {
                            Label("Delete", systemImage: "trash.fill")
                        })
                        .tint(.red)
                    }
                    .swipeActions(edge: .trailing) {
                        Button(action: {showDetails = true}, label: {
                            Label("Edit", systemImage: "pencil")
                        })
                        .tint(.blue)
                    }
                    .swipeActions(edge: .trailing) {
                        Button(action: {
                            if let index = tasks.firstIndex(of: task) {
                                tasks.remove(at: index)
                            }
                        }, label: {
                            Label("complete", systemImage: "checkmark.circle.fill")
                        })
                        .tint(.green)
                    }
                    .sheet(isPresented: $showDetails){
                        FormView()
                    }
            }
        }
    }
}

#Preview {
    ListView()
}
