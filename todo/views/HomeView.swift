//
//  HomeView.swift
//  todo
//
//  Created by g1alexander on 11/13/23.
//

import SwiftUI

struct HomeView: View {
    @State private var showDetails  = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ListView()
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
               FormView()
            }
        }
    }
}

#Preview {
    HomeView()
}
