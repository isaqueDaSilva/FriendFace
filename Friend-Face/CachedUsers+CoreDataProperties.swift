//
//  CachedUsers+CoreDataProperties.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 09/09/23.
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

extension CachedUsers : Identifiable {

}
