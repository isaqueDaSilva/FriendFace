//
//  Tags+CoreDataClass.swift
//  FriendFace
//
//  Created by Isaque da Silva on 08/09/23.
//
//

import Foundation
import CoreData

@objc(Tags)
public class Tags: NSManagedObject, Decodable {
    enum CodingKeys: CodingKey {
        case tag, user
    }
    
    public required convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw Errors.missingManagedObjectContext
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.tag = try container.decode(String.self, forKey: .tag)
        self.user = try container.decode(Set<User>.self, forKey: .user) as NSSet
    }
}
