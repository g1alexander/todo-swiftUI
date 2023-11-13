//
//  TodoView.swift
//  todo
//
//  Created by g1alexander on 11/13/23.
//

import SwiftUI

struct TodoView: View {
    var body: some View {
        TabView {
            HomeView().tabItem {
                Text("Todos")
                Image(systemName: "list.bullet")
            }
            
            CompleteTaskView().tabItem {
                Text("Complete")
                Image(systemName: "checkmark.circle.fill")
            }
        }
    }
}

#Preview {
    TodoView()
}
