//
//  Todo.swift
//  todo
//
//  Created by g1alexander on 11/13/23.
//

import Foundation


struct Todo: Identifiable, Codable {
    var id: Int
    var name: String
    var description: String
    
    init(id: Int, name: String, description: String) {
        self.id = id
        self.name = name
        self.description = description
    }
}

extension Todo {
    static let sampleData: [Todo]  =  [
        Todo(id: 1, name: "", description: "")
    ]
}

extension Todo {
    static func mapDataAPI(fetchData: TodoAPI, isComplete: Bool) -> [Todo] {
        
        let mapData = fetchData.data
            .filter { todo in
                return todo.attributes.complete == isComplete
            }
            .map { todo in
                Todo(id:todo.id, name: todo.attributes.name, description: todo.attributes.description)
            }
        
        return mapData
        
    }
}
