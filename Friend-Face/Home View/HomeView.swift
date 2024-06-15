//
//  HomeView.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 08/09/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.viewState {
                case .loading:
                    ProgressView()
                case .load:
                    HomeViewPopulated()
                case .loadWithContentUnavaiable:
                    HomeViewWithContentUnavaiable()
                }
            }
            .navigationTitle("Friend Face")
            .refreshable {
                viewModel.fetchUsers()
            }
        }
    }
    
    init(preview: Bool = false) {
        _viewModel = StateObject(wrappedValue: .init(preview: preview))
    }
}

#Preview {
    HomeView(preview: true)
}
