//
//  HomeViewModel.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 08/09/23.
//

import Foundation

extension HomeView {
    class HomeViewModel: ObservableObject {
        let manager = CoreDataManager()
        @Published var users = [Users]()
        @Published var userByCoreData = [CachedUsers]()
        
        func loadUsers() {
            DispatchQueue.main.async {
                self.userByCoreData = self.manager.users
            }
        }
        
        func getUsers() async throws {
            let apiURL = "https://www.hackingwithswift.com/samples/friendface.json"
            
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
                let usersDecoder = try decoder.decode([Users].self, from: data)
                usersDecoder.forEach { user in
                    let usersSaved = CachedUsers(context: manager.context)
                    usersSaved.id = user.id
                    usersSaved.isActive = user.isActive
                    usersSaved.name = user.name
                    usersSaved.age = Int16(user.age)
                    usersSaved.company = user.company
                    usersSaved.email = user.email
                    usersSaved.address = user.address
                    usersSaved.about = user.about
                    usersSaved.registered = user.registered
                    manager.save()
                    loadUsers()
                }
                DispatchQueue.main.async {
                    self.users = usersDecoder
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
