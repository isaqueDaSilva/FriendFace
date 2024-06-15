//
//  UserLoader.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 15/06/24.
//

import Foundation

extension HomeView {
    enum UserLoader {
        static func load() async throws -> [User] {
            try await UserFetcher.fetch()
            
            let usersCached = try await CacheStoreService.load()
            
            return usersCached
        }
    }
}

struct Store {
    var users = [User]()
}
