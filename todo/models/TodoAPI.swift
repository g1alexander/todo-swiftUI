//
//  TodoAPI.swift
//  todo
//
//  Created by g1alexander on 11/15/23.
//

import Foundation

// MARK: - TodoAPI
struct TodoAPI: Codable {
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let attributes: Attributes
}

// MARK: - Attributes
struct Attributes: Codable {
    let name: String
    let complete: Bool
    let createdAt, updatedAt, publishedAt, description: String
}
