//
//  Users+CoreDataProperties.swift
//  FriendFace
//
//  Created by Isaque da Silva on 08/09/23.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: String?
    @NSManaged public var friends: NSSet?
    @NSManaged public var tags: NSSet?

}

// MARK: Generated accessors for friends
extension Users {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: Friends)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: Friends)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

// MARK: Generated accessors for tags
extension Users {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: UserTags)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: UserTags)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}

extension Users : Identifiable {

}
