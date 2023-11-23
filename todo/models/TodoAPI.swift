//
//  TodoAPI.swift
//  todo
//
//  Created by g1alexander on 11/15/23.
//

import Foundation

struct TodoApiOne: Codable {
    let data: Datum
}

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

struct DataSendApi: Codable {
    let data: Data
}

struct Data: Codable {
    let name: String
    let complete: Bool?
    let description: String
}



extension TodoAPI {
    static func GETALL(isComplete: Bool) async -> [Todo]? {
        let apiURL = ProcessInfo.processInfo.environment["API_URL"] ?? ""
        
        // create url
        guard let url = URL(string: "\(apiURL)/api/todos") else {
            print("NOT working...")
            return nil
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
                let todos = Todo.mapDataAPI(fetchData: decodeResponse, isComplete: isComplete)
                
                return todos
            } else {
                print("noo")
                return nil
            }
            
        } catch {
            print("not api :(")
            return nil
        }
    }
    
    static func POST(data: DataSendApi) async -> Todo? {
        let apiURL = ProcessInfo.processInfo.environment["API_URL"] ?? ""
        
        // create url
        guard let url = URL(string: "\(apiURL)/api/todos") else {
            print("NOT working...")
            return nil
        }
        
        // fetch data from that url
        
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonData = try encoder.encode(data)
            
            // Crear la solicitud URLRequest
            var request = URLRequest(url: url)
            request.httpBody = jsonData
            request.httpMethod = "POST"  // Puedes ajustar el método HTTP según tus necesidades
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("Bearer e7dddce40d536c073c3dd4d715d6f9bf3f6accbd717e412f12d7007851c00396251da16c7a2199e4e69a7ff1e759b0e20dd1957cd83087a216f5bc5e1b6a479543bf753a7c3c0db42b16b58dd78883c24ed3c4831c5c8957e951028474359cab96986bf6726e1f4e028fa3ca8046151abe038c98fabdb23647e0fb1241813161", forHTTPHeaderField: "Authorization")
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            // decode that data
            if let decodeResponse = try? JSONDecoder().decode(TodoApiOne.self, from: data) {
                let todo = Todo(id: decodeResponse.data.id, name: decodeResponse.data.attributes.name, description: decodeResponse.data.attributes.description)
                
                return todo
            } else {
                print("noo")
                return nil
            }
            
        } catch {
            print("not api :(")
            return nil
        }
    }
    
    static func PUT(data: DataSendApi, id: Int) async -> Todo? {
        let apiURL = ProcessInfo.processInfo.environment["API_URL"] ?? ""
        
        // create url
        guard let url = URL(string: "\(apiURL)/api/todos/\(id)") else {
            print("NOT working...")
            return nil
        }
        
        // fetch data from that url
        
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonData = try encoder.encode(data)
            
            // Crear la solicitud URLRequest
            var request = URLRequest(url: url)
            request.httpBody = jsonData
            request.httpMethod = "PUT"  // Puedes ajustar el método HTTP según tus necesidades
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("Bearer e7dddce40d536c073c3dd4d715d6f9bf3f6accbd717e412f12d7007851c00396251da16c7a2199e4e69a7ff1e759b0e20dd1957cd83087a216f5bc5e1b6a479543bf753a7c3c0db42b16b58dd78883c24ed3c4831c5c8957e951028474359cab96986bf6726e1f4e028fa3ca8046151abe038c98fabdb23647e0fb1241813161", forHTTPHeaderField: "Authorization")
            
            // Crear una tarea de sesión para enviar la solicitud
            let (data, _) = try await URLSession.shared.data(for: request)
            
            // decode that data
            if let decodeResponse = try? JSONDecoder().decode(TodoApiOne.self, from: data) {
                let todo = Todo(id: decodeResponse.data.id, name: decodeResponse.data.attributes.name, description: decodeResponse.data.attributes.description)
                
                return todo
            } else {
                print("noo")
                return nil
            }
            
        } catch {
            print("not api :(")
            return nil
        }
    }
    
    static func DELETE(id: Int) async {
        let apiURL = ProcessInfo.processInfo.environment["API_URL"] ?? ""
        
        // create url
        guard let url = URL(string: "\(apiURL)/api/todos/\(id)") else {
            print("NOT working...")
            return
        }
        
        // fetch data from that url
        
        // Crear la solicitud URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"  // Puedes ajustar el método HTTP según tus necesidades
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer e7dddce40d536c073c3dd4d715d6f9bf3f6accbd717e412f12d7007851c00396251da16c7a2199e4e69a7ff1e759b0e20dd1957cd83087a216f5bc5e1b6a479543bf753a7c3c0db42b16b58dd78883c24ed3c4831c5c8957e951028474359cab96986bf6726e1f4e028fa3ca8046151abe038c98fabdb23647e0fb1241813161", forHTTPHeaderField: "Authorization")
        
        // Crear una tarea de sesión para enviar la solicitud
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            // Manejar la respuesta aquí
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
                // Puedes procesar más la respuesta según sea necesario
            }
            
            if let responseData = data {
                // Puedes manejar los datos de la respuesta aquí
                print("Datos de respuesta: \(String(data: responseData, encoding: .utf8) ?? "")")
            }
        }
        
        // Iniciar la tarea
        task.resume()
    }
}
