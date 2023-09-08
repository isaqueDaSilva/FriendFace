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
        @Published var users = [UserModel]()
        
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
                let userDecoder = try decoder.decode([UserModel].self, from: data)

                DispatchQueue.main.async {
                    self.users = userDecoder
                }
            } catch {
                throw Errors.invalidData
            }
        }
        
        func saveUsers() {
            Task {
                users.forEach { user in
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
                }
            }
        }
    }
}
