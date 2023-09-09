//
//  CachedUsers+CoreDataProperties.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 08/09/23.
//
//

import Foundation
import CoreData


extension CachedUsers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUsers> {
        return NSFetchRequest<CachedUsers>(entityName: "CachedUsers")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: Date?
    @NSManaged public var tags: NSSet?
    @NSManaged public var friends: NSSet?
    
    public var wrappedName: String {
        name ?? "Unknown Name"
    }
    
    public var wrappedCompany: String {
        company ?? "Unknown Company"
    }
    
    public var wrappedEmail: String {
        email ?? "No Email"
    }
    
    public var wrappedAddress: String {
        address ?? "Unknown Adress"
    }
    
    public var wrappedAbout: String {
        about ?? "No Bio"
    }
    
    public var wrappedregistered: Date {
        registered ?? Date.now
    }
}

// MARK: Generated accessors for tags
extension CachedUsers {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: CachedTags)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: CachedTags)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}

// MARK: Generated accessors for friends
extension CachedUsers {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CachedFriends)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CachedFriends)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension CachedUsers : Identifiable {

}
