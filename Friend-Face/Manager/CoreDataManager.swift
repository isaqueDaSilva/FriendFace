//
//  CoreDataManager.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 08/09/23.
//

import CoreData
import Foundation

actor CoreDataManager {
    static let shared = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext

    
    func save() {
        do {
            try context.save()
        } catch let error {
            print("Falied to save User in Data Model. Error: \(error)")
        }
    }
    
    func saveUsers(_ user: Users) {
        let usersSaved = CachedUsers(context: context)
        usersSaved.id = user.id
        usersSaved.isActive = user.isActive
        usersSaved.name = user.name
        usersSaved.age = Int16(user.age)
        usersSaved.company = user.company
        usersSaved.email = user.email
        usersSaved.address = user.address
        usersSaved.about = user.about
        usersSaved.registered = user.registered
        save()
    }
    
    init() {
        container = NSPersistentContainer(name: "FriendFace")
        context = container.viewContext
        
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Falied to load User. Error: \(error)")
            }
        }        
        self.context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }
}
