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
                            Text(user.wrappedName)
                        }
                    }
                }
            }
            .task {
                await viewModel.manager.fetchUser()
                print("Carregado do Core Data")
            }
            .listStyle(.plain)
            .navigationTitle("Friend Face")
        }
    }
}
