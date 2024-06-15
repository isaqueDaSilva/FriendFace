//
//  HomeViewWithContentUnavaiable.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 02/04/24.
//

import SwiftUI

extension HomeView {
    @ViewBuilder
    func HomeViewWithContentUnavaiable() -> some View {
        ContentUnavailableView(
            "No users returned.",
            systemImage: "exclamationmark.magnifyingglass",
            description: Text("We were unable to retrieve the full list of users, please check your connection or try again later.")
        )
    }
}

#Preview {
    HomeView()
}
