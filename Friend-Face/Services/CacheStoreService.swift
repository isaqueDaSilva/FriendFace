//
//  CacheStoreService.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 14/06/24.
//

import Foundation

enum CacheStoreService {
    private static func fileURL() throws -> URL {
        try FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false
        )
        .appending(path: "users.data")
    }
    
    static func save(_ users: [User]) async throws {
        let task = Task {
            let encoder = JSONEncoder()
            let data = try encoder.encode(users)
            let url = try Self.fileURL()
            
            print(url)
            
            try data.write(to: url)
        }
        
        _ = try await task.value
    }
    
    static func load() async throws -> [User] {
        let task = Task<[User], Error> {
            let url = try Self.fileURL()
            
            
            guard let data = try? Data(contentsOf: url) else {
                throw Errors.badGetContent
            }
            
            let decoder = JSONDecoder()
            
            let users = try decoder.decode([User].self, from: data)
            
            return users
        }
        
        let users = try await task.value
        return users
    }
}
