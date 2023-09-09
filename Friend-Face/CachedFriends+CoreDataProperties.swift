//
//  CachedFriends+CoreDataProperties.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 08/09/23.
//
//

import Foundation
import CoreData


extension CachedFriends {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriends> {
        return NSFetchRequest<CachedFriends>(entityName: "CachedFriends")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var user: NSSet?
    
    public var wrappedName: String {
        name ?? ""
    }
}

// MARK: Generated accessors for user
extension CachedFriends {

    @objc(addUserObject:)
    @NSManaged public func addToUser(_ value: CachedUsers)

    @objc(removeUserObject:)
    @NSManaged public func removeFromUser(_ value: CachedUsers)

    @objc(addUser:)
    @NSManaged public func addToUser(_ values: NSSet)

    @objc(removeUser:)
    @NSManaged public func removeFromUser(_ values: NSSet)

}

extension CachedFriends : Identifiable {

}
