//
//  Todo.swift
//  todo
//
//  Created by g1alexander on 11/13/23.
//

import Foundation


struct Todo: Identifiable, Codable {
    var id: UUID
    var name: String
    var description: String
    
    init(id: UUID = UUID(), name: String, description: String) {
        self.id = id
        self.name = name
        self.description = description
    }
}

extension Todo {
    static let sampleData: [Todo]  =  [
        Todo(name: "todo 1", description: "holii"),
        Todo(name: "jajaja", description: "siuuu")
    ]
}
