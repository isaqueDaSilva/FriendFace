//
//  User.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 14/06/24.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    let id: UUID
    let name: String
    let age: Int
    let email: String
    let about: String
    let company: String
    let address: String
    let registered: Date
    let isActive: Bool
    let tags: [String]
    let friends: [Friend]
}

extension User {
    static let dummyFriends: [Friend] = {
        var dummyResults = [Friend]()
        
        for index in 0..<10 {
            let friends = Friend(id: .init(), name: "\(index + 1)")
            dummyResults.append(friends)
        }
        
        return dummyResults
    }()
    
    static let dummyUser: [User] = {
        var dummyResults = [User]()
        
        for index in 0..<10 {
            let user = User(
                id: .init(),
                name: "\(index + 1)",
                age: index * 5,
                email: "\(index)@gmail.com",
                about: "\(index)",
                company: "\(index) Company",
                address: "\(index) Street",
                registered: .now,
                isActive: Bool.random(),
                tags: ["\(index)"],
                friends: dummyFriends
            )
            
            dummyResults.append(user)
        }
        
        return dummyResults
    }()
}
