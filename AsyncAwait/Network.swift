//
//  Network.swift
//  AsyncAwait
//
//  Created by puneet pal on 22/08/23.
//

import Foundation

let userURL = "https://jsonplaceholder.typicode.com/users"
enum DataError: Error {
    case InvalidUrl
    case InvalidResponse
    case InvalidData
}
class Network {
    
    func fetchUsers<T: Decodable>(url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw DataError.InvalidUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw DataError.InvalidResponse
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
