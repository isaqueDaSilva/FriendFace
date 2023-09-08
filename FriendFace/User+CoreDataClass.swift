//
//  User+CoreDataClass.swift
//  FriendFace
//
//  Created by Isaque da Silva on 08/09/23.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject, Decodable {
    enum CodingKeys: CodingKey {
        case id, isActive, name, age, company, email, adress, about, registered, friends, tags
    }
    
    public required convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw Errors.missingManagedObjectContext
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.isActive = try container.decode(Bool.self, forKey: .isActive)
        self.name = try container.decode(String.self, forKey: .name)
        self.age = try container.decode(Int16.self, forKey: .age)
        self.company = try container.decode(String.self, forKey: .company)
        self.email = try container.decode(String.self, forKey: .email)
        self.address = try container.decode(String.self, forKey: .adress)
        self.about = try container.decode(String.self, forKey: .about)
        self.registered = try container.decode(Date?.self, forKey: .registered)
        self.friends = try container.decode(Set<Friend>.self, forKey: .friends) as NSSet
        self.tags = try container.decode(Set<Tags>.self, forKey: .tags) as NSSet
    }
}
