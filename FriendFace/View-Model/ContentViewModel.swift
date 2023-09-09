//
//  ContentViewModel.swift
//  FriendFace
//
//  Created by Isaque da Silva on 02/09/23.
//

import Foundation

extension ContentView {
    class ContentViewModel: ObservableObject {
        let manager = CoreDataManager()
        @Published var users = [User]()
        
        @MainActor
        func loadUsers() async -> [User] {
            self.users = await manager.users
            return users
        }
        
        func getUsers() async throws {
            var usersDecoder = [UserModel]()
            let apiURL = "
            "
            
            guard let url = URL(string: apiURL) else {
                throw Errors.invalidURL
            }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw Errors.invalidResponse
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601
                usersDecoder = try decoder.decode([UserModel].self, from: data)
                usersDecoder.forEach { user in
                    Task {
                        let usersSaved = User(context: manager.context)
                        usersSaved.id = user.id
                        usersSaved.isActive = user.isActive
                        usersSaved.name = user.name
                        usersSaved.age = Int16(user.age)
                        usersSaved.company = user.company
                        usersSaved.email = user.email
                        usersSaved.address = user.address
                        usersSaved.about = user.about
                        usersSaved.registered = user.registered
                        //usersSaved.tags = user.tags.joined(separator: ",")
                        user.friends.forEach { friend in
                            Task {
                                await manager.friendsList(id: friend.id, name: friend.name)
                            }
                        }
                        await manager.save()
                    }
                }
            } catch {
                throw Errors.invalidData
            }
        }
        
        init() {
            Task {
               try await getUsers()
            }
        }
    }
}


/*
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
*/

/*
 public var wrappedName: String {
     name ?? ""
 }
 
 public var wrappedUser: [User] {
     let setArray = user as? Set<User> ?? []
     return setArray.sorted { $0.wrappedName < $1.wrappedName }
 }
*/


