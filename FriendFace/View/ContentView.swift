//
//  ContentView.swift
//  FriendFace
//
//  Created by Isaque da Silva on 01/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.users) { user in
                    NavigationLink {
                        UserMainView(user: user)
                    } label: {
                        HStack {
                            Text("\(user.isActive ? "😎" : "😴")")
                            Text(user.name)
                        }
                    }
                }
            }
            .task {
                do {
                    try await viewModel.getUsers()
                } catch {
                    print("Falied to load User. Error: \(error)")
                }
            }
            .listStyle(.plain)
            .navigationTitle("Friend Face")
        }
    }
}
