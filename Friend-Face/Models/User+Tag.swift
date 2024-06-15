//
//  Tag.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 03/04/24.
//

import Foundation

extension User {
    struct Tag: Identifiable, Codable {
        let id: UUID
        let tag: String
        
        init(tag: String) {
            self.id = UUID()
            self.tag = tag
        }
    }
}
