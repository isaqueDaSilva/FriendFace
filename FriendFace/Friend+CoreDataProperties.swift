//
//  Friend+CoreDataProperties.swift
//  FriendFace
//
//  Created by Isaque da Silva on 08/09/23.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var user: NSSet?
    
    public var wrappedName: String {
        name ?? ""
    }
    
    public var wrappedUser: [User] {
        let setArray = user as? Set<User> ?? []
        return setArray.sorted { $0.wrappedName < $1.wrappedName }
    }
}

// MARK: Generated accessors for user
extension Friend {

    @objc(addUserObject:)
    @NSManaged public func addToUser(_ value: User)

    @objc(removeUserObject:)
    @NSManaged public func removeFromUser(_ value: User)

    @objc(addUser:)
    @NSManaged public func addToUser(_ values: NSSet)

    @objc(removeUser:)
    @NSManaged public func removeFromUser(_ values: NSSet)

}

extension Friend : Identifiable {

}
