//
//  HomeView.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 08/09/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var networkManager = NetworkManager()
    var body: some View {
        Group {
            if networkManager.isConnected {
                HomeViewOnline()
            } else {
                HomeViewOffline()
            }
        }
    }
}

struct HomeViewOnline: View {
    @StateObject var viewModel = HomeView.HomeViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.users) { user in
                    NavigationLink {
                        UserDetailsView(user: user, userByCoreData: nil)
                    } label: {
                        HStack {
                            Text("\(user.isActive ? "😎" : "😴")")
                            Text(user.name)
                        }
                    }
                }
            }
            .task {
                if viewModel.users.isEmpty {
                    do {
                        try await viewModel.getUsers()
                    } catch let error {
                        print("Failed to load users. Error: \(error)")
                    }
                }
            }
            .navigationTitle("Friend Face")
            .listStyle(.plain)
        }
    }
}

struct HomeViewOffline: View {
    @StateObject var viewModel = HomeView.HomeViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.usersByCoreData) { user in
                    NavigationLink {
                        UserDetailsView(user: nil, userByCoreData: user)
                    } label: {
                        HStack {
                            Text("\(user.isActive ? "😎" : "😴")")
                            Text(user.wrappedName)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchUsers()
            }
            .navigationTitle("Friend Face")
            .listStyle(.plain)
        }
    }
}
