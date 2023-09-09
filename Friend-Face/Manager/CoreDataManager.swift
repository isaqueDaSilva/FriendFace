//
//  CoreDataManager.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 08/09/23.
//

import CoreData
import Foundation

class CoreDataManager {
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    var users = [CachedUsers]()
    
    func fetchUsers() {
        let request = NSFetchRequest<CachedUsers>(entityName: "CachedUsers")
        
        do {
            users = try context.fetch(request)
        } catch let error {
            print("Falied to Fetch User in Data Model. Error: \(error)")
        }
    }
    
    func save() {
        do {
            try context.save()
            fetchUsers()
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
