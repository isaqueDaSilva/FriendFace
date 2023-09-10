//
//  HomeViewModel.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 08/09/23.
//

import CoreData
import Foundation

extension HomeView {
    class HomeViewModel: ObservableObject {
        let manager = CoreDataManager.shared
        @Published var users = [Users]()
        @Published var usersByCoreData = [CachedUsers]()
        
        func fetchUsers() {
            let request = NSFetchRequest<CachedUsers>(entityName: "CachedUsers")
            
            do {
                let user = try manager.context.fetch(request)
                DispatchQueue.main.async {
                    self.usersByCoreData = user
                }
            } catch let error {
                print("Falied to Fetch User in Data Model. Error: \(error)")
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
                DispatchQueue.main.async {
                    self.usersByCoreData.removeAll()
                }
                usersDecoder.forEach { user in
                    Task {
                        await manager.saveUsers(user)
                    }
                }
                DispatchQueue.main.async {
                    self.users = usersDecoder
                }
            } catch {
                throw Errors.invalidData
            }
        }
    }
}
