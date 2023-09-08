//
//  Tags+CoreDataProperties.swift
//  FriendFace
//
//  Created by Isaque da Silva on 08/09/23.
//
//

import Foundation
import CoreData


extension Tags {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tags> {
        return NSFetchRequest<Tags>(entityName: "Tags")
    }

    @NSManaged public var tag: String?
    @NSManaged public var user: NSSet?
    
    public var wrappedTag: String {
        tag ?? "Unknown Tag"
    }
    
    public var wrappedUser: [User] {
        let setArray = user as? Set<User> ?? []
        
        return setArray.sorted { $0.wrappedName < $1.wrappedName }
    }
}

// MARK: Generated accessors for user
extension Tags {

    @objc(addUserObject:)
    @NSManaged public func addToUser(_ value: User)

    @objc(removeUserObject:)
    @NSManaged public func removeFromUser(_ value: User)

    @objc(addUser:)
    @NSManaged public func addToUser(_ values: NSSet)

    @objc(removeUser:)
    @NSManaged public func removeFromUser(_ values: NSSet)

}

extension Tags : Identifiable {

}
