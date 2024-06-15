//
//  UserFetcher.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 14/06/24.
//

import Foundation

extension HomeView {
    enum UserFetcher {
        static func fetch() async throws {
            let endpoint = "https://www.hackingwithswift.com/samples/friendface.json"
            
            guard let url = URL(string: endpoint) else {
                throw Errors.badURL
            }
            
            let request = URLRequest(url: url)
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw Errors.badResponse
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let users = try? decoder.decode([User].self, from: data) else {
                throw Errors.badDecoding
            }
            
            print(users.count)
            
            try await CacheStoreService.save(users)
        }
    }
}
