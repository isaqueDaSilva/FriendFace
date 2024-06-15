//
//  HomeViewModel.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 08/09/23.
//

import Foundation

extension HomeView {
    @MainActor
    final class HomeViewModel: ObservableObject {
        @Published var users = [User]()
        @Published var viewState: ViewState = .loading
        
        func fetchUsers() {
            Task {
                do {
                    if viewState != .loading {
                        viewState = .loading
                    }
                    
                    //try await CacheStoreService.delete()
                    
                    let usersCached = try await UserLoader.load()
                    
                    await MainActor.run {
                        users = usersCached
                        viewState = .load
                    }
                } catch let error {
                    viewState = .loadWithContentUnavaiable
                    print(error.localizedDescription)
                }
            }
        }
        
        init(preview: Bool = false) {
            if preview {
                users = User.dummyUser
                viewState = .load
            } else {
                fetchUsers()
            }
        }
    }
}
