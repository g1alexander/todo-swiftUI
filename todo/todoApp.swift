//
//  todoApp.swift
//  todo
//
//  Created by g1alexander on 11/13/23.
//

import SwiftUI

@main
struct todoApp: App {
    @State private var todos = Todo.sampleData
    
    var body: some Scene {
        WindowGroup {
            TodoView(todos: $todos)
                .task {
                    await fetchData()
                }
        }
        
    }
    
    func fetchData() async {
        let apiURL = ProcessInfo.processInfo.environment["API_URL"] ?? ""
        
        // create url
        guard let url = URL(string: "\(apiURL)/api/todos") else {
            print("NOT working...")
            return
        }
        
        // Crear la solicitud URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "GET"  // Puedes ajustar el método HTTP según tus necesidades
        request.addValue("Bearer e7dddce40d536c073c3dd4d715d6f9bf3f6accbd717e412f12d7007851c00396251da16c7a2199e4e69a7ff1e759b0e20dd1957cd83087a216f5bc5e1b6a479543bf753a7c3c0db42b16b58dd78883c24ed3c4831c5c8957e951028474359cab96986bf6726e1f4e028fa3ca8046151abe038c98fabdb23647e0fb1241813161", forHTTPHeaderField: "Authorization")
        
       
        // fetch data from that url
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            // decode that data
            if let decodeResponse = try? JSONDecoder().decode(TodoAPI.self, from: data) {
                todos = Todo.mapDataAPI(fetchData: decodeResponse)
            } else {
                print("noo")
            }
            
        } catch {
            print("not api :(")
        }
        
        
    }
}
