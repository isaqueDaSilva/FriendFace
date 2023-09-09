//
//  FriendsListView.swift
//  FriendFace
//
//  Created by Isaque da Silva on 01/09/23.
//

import SwiftUI

struct FriendsListView: View {
    let user: User
    
    var body: some View {
        List {
//            ForEach(user.friends) { friend in
//                HStack {
//                    Text(friend.name)
//                        .font(.headline.bold())
//                }
//            }
        }
        .listStyle(.plain)
        .navigationTitle("Friend List")
        .navigationBarTitleDisplayMode(.inline)
    }
}
