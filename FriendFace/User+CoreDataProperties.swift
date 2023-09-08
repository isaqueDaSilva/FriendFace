//
//  User+CoreDataProperties.swift
//  FriendFace
//
//  Created by Isaque da Silva on 08/09/23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: Date?
    @NSManaged public var friends: NSSet?
    @NSManaged public var tags: NSSet?
    
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
    
    public var wrappedFriends: [Friend] {
        let setArray = friends as? Set<Friend> ?? []
        return setArray.sorted {$0.wrappedName < $1.wrappedName }
    }
    
    public var wrappedTags: [Tags] {
        let setArray = tags as? Set<Tags> ?? []
        return setArray.sorted { $0.wrappedTag < $1.wrappedTag }
    }
}

// MARK: Generated accessors for friends
extension User {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: Friend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: Friend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

// MARK: Generated accessors for tags
extension User {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: Tags)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: Tags)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}

extension User : Identifiable {

}
