//
//  FriendListView.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 08/09/23.
//

import SwiftUI

struct FriendListView: View {
    let user: Users?
    
    var body: some View {
        if user != nil {
            List {
                ForEach(user?.friends ?? []) { friend in
                    HStack {
                        Text(friend.name)
                            .font(.headline.bold())
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Friend List")
            .navigationBarTitleDisplayMode(.inline)
        } else {
            VStack {
                Image(systemName: "wifi.slash")
                    .font(.system(size: 30))
                    .padding()
                Text("Connect to the internet to get the user list!")
                    .font(.callout.bold())
            }
        }
    }
}
