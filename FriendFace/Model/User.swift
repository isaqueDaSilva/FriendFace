//
//  User.swift
//  FriendFace
//
//  Created by Isaque da Silva on 02/09/23.
//

import Foundation

struct UserModel: Codable, Identifiable {
    var id: UUID
    var isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [FriendsModel]
}
