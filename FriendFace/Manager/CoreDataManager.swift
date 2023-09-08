//
//  CoreDataManager.swift
//  FriendFace
//
//  Created by Isaque da Silva on 07/09/23.
//

import CoreData
import Foundation

actor CoreDataManager {
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    var users = [User]()
    
    func fetchUser() {
        let request = NSFetchRequest<User>(entityName: "User")
        
        do {
            users = try context.fetch(request)
        } catch {
            print("Falied to Fetch User in Data Model. Error: \(error)")
        }
    }
    
    func save() {
        do {
            try context.save()
            fetchUser()
        } catch let error {
            print("Falied to save User in Data Model. Error: \(error)")
        }
    }
    
    init() {
        container = NSPersistentContainer(name: "FriendFace")
        context = container.viewContext
        
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Falied to load User. Error: \(error)")
            }
        }
    }
}
