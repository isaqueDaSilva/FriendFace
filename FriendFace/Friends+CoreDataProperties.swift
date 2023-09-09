//
//  Friends+CoreDataProperties.swift
//  FriendFace
//
//  Created by Isaque da Silva on 08/09/23.
//
//

import Foundation
import CoreData


extension Friends {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friends> {
        return NSFetchRequest<Friends>(entityName: "Friends")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var user: NSSet?

}

// MARK: Generated accessors for user
extension Friends {

    @objc(addUserObject:)
    @NSManaged public func addToUser(_ value: Users)

    @objc(removeUserObject:)
    @NSManaged public func removeFromUser(_ value: Users)

    @objc(addUser:)
    @NSManaged public func addToUser(_ values: NSSet)

    @objc(removeUser:)
    @NSManaged public func removeFromUser(_ values: NSSet)

}

extension Friends : Identifiable {

}
