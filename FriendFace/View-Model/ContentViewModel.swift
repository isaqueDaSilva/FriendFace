//
//  ContentViewModel.swift
//  FriendFace
//
//  Created by Isaque da Silva on 02/09/23.
//

import Foundation

extension ContentView {
    class ContentViewModel: ObservableObject {
        @Published var users = [User]()
        
        func getUsers() async throws -> [User] {
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
                let userDecoder = try decoder.decode([User].self, from: data)
                DispatchQueue.main.async {
                    self.users = userDecoder
                }
            } catch {
                throw Errors.invalidData
            }
            
            return users
        }
    }
}
