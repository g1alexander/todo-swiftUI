//
//  CompleteTaskView.swift
//  todo
//
//  Created by g1alexander on 11/13/23.
//

import SwiftUI

struct CompleteTaskView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ListView()
            }
            .navigationTitle("Todos list")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CompleteTaskView()
}
