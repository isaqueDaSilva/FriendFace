//
//  Friend.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 08/09/23.
//

import Foundation

extension User {
    struct Friend: Identifiable, Hashable, Codable {
        let id: UUID
        var name: String
    }
}
