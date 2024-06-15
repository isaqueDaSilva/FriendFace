//
//  FriendListView.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 08/09/23.
//

import SwiftUI

struct FriendListView: View {
    let friends: [User.Friend]
    
    var body: some View {
        List(friends) { friend in
            Label(friend.name, systemImage: "person")
        }
        .listStyle(.plain)
        .navigationTitle("Friend List")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FriendListView(friends: User.dummyFriends)
}
