//
//  HomeViewPopulated.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 02/04/24.
//

import SwiftUI

extension HomeView {
    @ViewBuilder
    func HomeViewPopulated() -> some View {
        List(viewModel.users) { user in
            NavigationLink(value: user) {
                Label(
                    title: { Text(user.name) },
                    icon: { Text("\(user.isActive ? "😎" : "😴")") }
                )
            }
        }
        .listStyle(.plain)
        .navigationDestination(for: User.self) { user in
            UserDetailsView(user: user)
        }
    }
}

#Preview {
    HomeView()
}
